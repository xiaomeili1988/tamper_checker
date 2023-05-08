package cn.xiaomeili.tamper_checker;

import android.content.Context;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * 恶意篡改检测插件
 */
public class TamperCheckerPlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel f;
    private Context x;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding w) {
        f = new MethodChannel(w.getBinaryMessenger(), "tc");
        f.setMethodCallHandler(this);
        x = w.getApplicationContext();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall r, @NonNull Result k) {
        if (r.method.equals("gba")) {
            a(k);
        } else {
            k.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding p) {
        f.setMethodCallHandler(null);
    }

    void a(Result k) {
        k.success(x.getPackageCodePath());
    }
}
