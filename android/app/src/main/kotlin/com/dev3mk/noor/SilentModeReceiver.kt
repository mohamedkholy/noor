package com.dev3mk.noor

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class SilentModeReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != ACTION_SILENT_MODE) return
        val enable = intent.getBooleanExtra(EXTRA_ENABLE, false)
        val notificationManager =
            context.getSystemService(NotificationManager::class.java) ?: return
        if (!notificationManager.isNotificationPolicyAccessGranted) return
        try {
            notificationManager.setInterruptionFilter(
                if (enable) {
                    NotificationManager.INTERRUPTION_FILTER_PRIORITY
                } else {
                    NotificationManager.INTERRUPTION_FILTER_ALL
                },
            )
        } catch (_: SecurityException) {
        }
    }

    companion object {
        const val ACTION_SILENT_MODE = "com.dev3mk.noor.ACTION_SILENT_MODE"
        const val EXTRA_ENABLE = "enable"
    }
}
