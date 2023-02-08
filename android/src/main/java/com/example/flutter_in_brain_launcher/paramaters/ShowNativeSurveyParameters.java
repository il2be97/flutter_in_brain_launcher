package com.example.flutter_in_brain_launcher.paramaters;

import android.app.Activity;

import io.flutter.plugin.common.MethodCall;

public class ShowNativeSurveyParameters {
   public final String id;
    public final Activity activity;
    public  final String searchId;

    public static boolean checkIfParamsCorrect(MethodCall call) {
        return (call.hasArgument("id"));
    }

    public ShowNativeSurveyParameters(MethodCall call, Activity activity) {
        this.id = call.argument("id");
        this.searchId = "";
        this.activity = activity;
    }
}
