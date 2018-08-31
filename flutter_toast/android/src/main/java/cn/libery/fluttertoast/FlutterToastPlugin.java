package cn.libery.fluttertoast;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterToastPlugin
 */
public class FlutterToastPlugin implements MethodCallHandler {
    private static final String TAG = "FlutterToastPlugin";

    private static Context context;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        context = registrar.context();
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_toast");
        channel.setMethodCallHandler(new FlutterToastPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        String message = call.argument("message");
        switch (call.method) {
            case "showToast":
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
                break;
            case "showLongToast":
                Toast.makeText(context, message, Toast.LENGTH_LONG).show();
                break;
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;
            default:
                result.notImplemented();
        }
    }

}
