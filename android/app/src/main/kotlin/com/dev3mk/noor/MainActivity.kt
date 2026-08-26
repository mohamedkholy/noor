package com.dev3mk.noor

import android.app.AlarmManager
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Intent
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "noor/silent_mode"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "isDndPermissionGranted" -> result.success(isDndPermissionGranted())
                "openDndSettings" -> {
                    startActivity(
                        Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS),
                    )
                    result.success(true)
                }
                "scheduleSilentWindows" -> {
                    val windows =
                        call.argument<List<Map<String, Long>>>("windows") ?: emptyList()
                    scheduleSilentWindows(windows)
                    result.success(true)
                }
                "cancelSilentWindows" -> {
                    cancelSilentWindows()
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun notificationManager(): NotificationManager =
        getSystemService(NotificationManager::class.java)

    private fun isDndPermissionGranted(): Boolean =
        notificationManager().isNotificationPolicyAccessGranted

    private fun scheduleSilentWindows(windows: List<Map<String, Long>>) {
        cancelSilentWindows()
        val alarmManager = getSystemService(AlarmManager::class.java)
        if (!alarmManager.canScheduleExactAlarms()) return
        val now = System.currentTimeMillis()
        var requestCode = 0
        for (window in windows) {
            val start = window["start"] ?: continue
            val end = window["end"] ?: continue
            if (end <= now) continue
            if (start > now) {
                setDndAlarm(alarmManager, start, true, requestCode)
            } else if (isDndPermissionGranted()) {
                try {
                    notificationManager().setInterruptionFilter(
                        NotificationManager.INTERRUPTION_FILTER_PRIORITY,
                    )
                } catch (_: SecurityException) {
                }
            }
            requestCode++
            setDndAlarm(alarmManager, end, false, requestCode)
            requestCode++
        }
    }

    private fun setDndAlarm(
        alarmManager: AlarmManager,
        triggerAtMillis: Long,
        enable: Boolean,
        requestCode: Int,
    ) {
        val intent =
            Intent(this, SilentModeReceiver::class.java)
                .setAction(SilentModeReceiver.ACTION_SILENT_MODE)
                .putExtra(SilentModeReceiver.EXTRA_ENABLE, enable)
        val pendingIntent =
            PendingIntent.getBroadcast(
                this,
                requestCode,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
        alarmManager.setExactAndAllowWhileIdle(
            AlarmManager.RTC_WAKEUP,
            triggerAtMillis,
            pendingIntent,
        )
    }

    private fun cancelSilentWindows() {
        val alarmManager = getSystemService(AlarmManager::class.java)
        for (requestCode in 0 until MAX_ALARM_COUNT) {
            val intent =
                Intent(this, SilentModeReceiver::class.java)
                    .setAction(SilentModeReceiver.ACTION_SILENT_MODE)
            val pendingIntent =
                PendingIntent.getBroadcast(
                    this,
                    requestCode,
                    intent,
                    PendingIntent.FLAG_NO_CREATE or PendingIntent.FLAG_IMMUTABLE,
                )
            if (pendingIntent != null) {
                alarmManager.cancel(pendingIntent)
                pendingIntent.cancel()
            }
        }
    }

    companion object {
        private const val MAX_ALARM_COUNT = 200
    }
}
