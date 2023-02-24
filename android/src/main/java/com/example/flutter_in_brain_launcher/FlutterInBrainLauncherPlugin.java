package com.example.flutter_in_brain_launcher;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.example.flutter_in_brain_launcher.managers.InBrainGetNativeSurveyCallback;
import com.example.flutter_in_brain_launcher.managers.InBrainManager;
import com.example.flutter_in_brain_launcher.managers.InBrainShowNativeSurveyCallback;
import com.example.flutter_in_brain_launcher.paramaters.ConfigureInBrainParameters;
import com.example.flutter_in_brain_launcher.paramaters.ShowNativeSurveyParameters;

import java.util.HashMap;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterInBrainLauncherPlugin */
public class FlutterInBrainLauncherPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  static Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_in_brain_launcher");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("launch_in_brain")) {
      if (ConfigureInBrainParameters.checkIfParamsCorrect(call)) {
        final ConfigureInBrainParameters parameters = new ConfigureInBrainParameters(call, activity);
        final InBrainManager inBrain = new InBrainManager();
        inBrain.configure(parameters);
        result.success(true);
      } else {
        result.error("1", "Invalid", "Incorrect params");
      }
    } else if (call.method.equals("show_native_survey")) {
      if (ShowNativeSurveyParameters.checkIfParamsCorrect(call)) {
        final ShowNativeSurveyParameters parameters = new ShowNativeSurveyParameters(call, activity);
        final InBrainManager inBrain = new InBrainManager();
        inBrain.showNativeSurvey(parameters, new InBrainShowNativeSurveyCallback() {
          @Override
          public void onSuccess() {
            result.success(true);
          }

          @Override
          public void onFail(String var1) {
            result.error("2", "Show native survey failed", var1);
          }
        });
      } else {
        result.error("1", "Invalid", "Incorrect params");
      }
    } else if (call.method.equals("get_native_survey")) {
      final InBrainManager inBrain = new InBrainManager();
      inBrain.getNativeSurvey(new InBrainGetNativeSurveyCallback() {
        @Override
        public void onSuccess(List<HashMap<String, Object>> list) {
          result.success(list);
        }
      });
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
}
