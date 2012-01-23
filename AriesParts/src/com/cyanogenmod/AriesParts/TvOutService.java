package com.cyanogenmod.AriesParts;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.hardware.TvOut;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.preference.PreferenceManager;
import android.view.Display;
import android.view.IRotationWatcher;
import android.view.IWindowManager;
import android.view.WindowManager;

public class TvOutService extends Service {

    public static final String EXTRA_COMMAND = "command";
    public static final String EXTRA_SYSTEM = "system";
    public static final String COMMAND_ENABLE = "enable";
    public static final String COMMAND_DISABLE = "disable";
    public static final String COMMAND_CHANGE_SYSTEM = "system";

    private TvOut mTvOut;
    private SharedPreferences mPref;
    private int mSystem;
    private boolean mWasOn = false; // For enabling on screen on

    private BroadcastReceiver mReceiver = new BroadcastReceiver() {

        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (Intent.ACTION_HEADSET_PLUG.equals(action)) {
                int state = intent.getIntExtra("state", 0);
                if (state == 0 && mTvOut._isEnabled()) {
                    // Disable when cable is unplugged
                    mWasOn = false;
                    disable();
                    stopSelf();
                }
            }
            else if (Intent.ACTION_SCREEN_ON.equals(action)) {
                if (mWasOn) {
                    SystemProperties.set("ctl.start", "tvouthack");
                    mWasOn = false;
                }
            }
            else if (Intent.ACTION_SCREEN_OFF.equals(action)) {
                if (mTvOut._isEnabled()) {
                    mWasOn = true;
                    SystemProperties.set("ctl.stop", "tvouthack");
                }
            }
        }

    };

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onCreate() {
        mTvOut = new TvOut();
        mPref = PreferenceManager.getDefaultSharedPreferences(this);

        IWindowManager wm = IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        try {
            wm.watchRotation(new IRotationWatcher.Stub() {
                @Override
                public void onRotationChanged(int rotation) {
                    TvOutService.this.onRotationChanged(rotation);
                }
            });
        }
        catch (RemoteException e) { }

        IntentFilter filter = new IntentFilter(Intent.ACTION_HEADSET_PLUG);
        filter.addAction(Intent.ACTION_SCREEN_OFF);
        filter.addAction(Intent.ACTION_SCREEN_ON);
        registerReceiver(mReceiver, filter);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null) {
            String command = intent.getStringExtra("command");
            if (COMMAND_ENABLE.equals(command)) {
                mSystem = Integer.parseInt(mPref.getString(AriesParts.KEY_TVOUT_SYSTEM, "2")); // Default = PAL
                enable();
            }
            else if (COMMAND_DISABLE.equals(command)) {
                disable();
                stopSelf();
            }
            else if (COMMAND_CHANGE_SYSTEM.equals(command)) {
                if (mTvOut._isEnabled()) {
                    mSystem = intent.getIntExtra(EXTRA_SYSTEM, 2);
                    disable();
                    enable();
                }
            }
        }

        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        unregisterReceiver(mReceiver);
        mTvOut.finalize();
        super.onDestroy();
    }

    public void onRotationChanged(int rotation) {
        mTvOut._SetOrientation(rotation);
    }

    private void enable() {
        mTvOut._SetTvSystem(mSystem);
        mTvOut._TvOutSetImageString("TV-out not supported while application running. Phone display only");

        Display display = ((WindowManager) getSystemService(Context.WINDOW_SERVICE)).getDefaultDisplay();
        mTvOut._SetOrientation(display.getRotation());

        mTvOut._EnableTvOut();
        mTvOut._setTvoutCableConnected(1);

        // Start tvouthack service used to bombard screen refresh messages
        SystemProperties.set("ctl.start", "tvouthack");
    }

    private void disable() {
        SystemProperties.set("ctl.stop", "tvouthack");

        mTvOut._DisableTvOut();
        mTvOut._setTvoutCableConnected(0);
    }

}
