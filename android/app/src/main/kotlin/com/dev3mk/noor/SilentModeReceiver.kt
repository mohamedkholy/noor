package com.dev3mk.noor

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

class SilentModeReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        Log.d("SilentModeReceiver", "onReceive: ${intent.action}")
        if (intent.action != ACTION_SILENT_MODE) return
        val enable = intent.getBooleanExtra(EXTRA_ENABLE, false)
        val notificationManager =
                context.getSystemService(NotificationManager::class.java) ?: return
        if (!notificationManager.isNotificationPolicyAccessGranted) return
        try {
            Log.d("SilentModeReceiver", "Setting interruption filter to $enable")
            notificationManager.setInterruptionFilter(
                    if (enable) {
                        NotificationManager.INTERRUPTION_FILTER_PRIORITY
                    } else {
                        NotificationManager.INTERRUPTION_FILTER_ALL
                    },
            )
            Log.d("SilentModeReceiver", "Interruption filter set to $enable")
        } catch (e: SecurityException) {
            Log.d("SilentModeReceiver", "Failed to set interruption filter: ${e.message}")
        }
    }

    companion object {
        const val ACTION_SILENT_MODE = "com.dev3mk.noor.ACTION_SILENT_MODE"
        const val EXTRA_ENABLE = "enable"
    }
}
