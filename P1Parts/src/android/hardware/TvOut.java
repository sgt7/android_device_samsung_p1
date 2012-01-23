package android.hardware;

import java.lang.ref.WeakReference;

import android.graphics.Bitmap;
import android.util.Log;

public class TvOut {
    private static final String TAG = "TvOut";

    private int mListenerContext;
    private int mNativeContext;

    public native void _DisableTvOut();

    public native void _EnableTvOut();

    public native void _SetOrientation(int paramInt);

    public native void _SetTvScreenSize(int paramInt);

    public native void _SetTvSystem(int paramInt);

    public native void _TvOutResume(int paramInt);

    public native void _TvOutSetImageString(String paramString);

    public native void _TvOutSuspend(String paramString);

    public native boolean _TvoutSubtitleIsEnable();

    public native boolean _TvoutSubtitlePostBitmap(Bitmap paramBitmap, int paramInt);

    public native boolean _TvoutSubtitleSetStatus(int paramInt);

    public native int _getSubtitleHDMIHeight();

    public native int _getSubtitleHDMIWidth();

    public native boolean _isEnabled();

    public native boolean _isSuspended();

    public native boolean _isTvoutCableConnected();

    private final native void _native_setup(Object paramObject);

    private final native void _release();

    public native void _setTvoutCableConnected(int paramInt);

    static {
        System.loadLibrary("tvout_jni");
    }

    public TvOut() {
        _native_setup(new WeakReference<TvOut>(this));
    }

    public void finalize() {
        _release();
    }

    private static void postEventFromNative(Object tvOutRef, int what, int arg1, int arg2, Object obj) {
        TvOut tvOut = (TvOut)((WeakReference<TvOut>)tvOutRef).get();

        Log.d(TAG, "Native Event: " + what + " " + arg1 + " " + arg2);
    }

}