package com.example.flutter_in_brain_launcher.paramaters;

import android.app.Activity;

import io.flutter.plugin.common.MethodCall;

public class ConfigureInBrainParameters {
    public final String apiClientId;
    public final String apiSecret;
    public final boolean isS2S;
    public final String userId;
    public final Activity activity;

    public static boolean checkIfParamsCorrect(MethodCall call) {
        return (call.hasArgument("apiClientID") && call.hasArgument("apiSecret") && call.hasArgument("userID") && call.hasArgument("isS2S"));
    }

    public ConfigureInBrainParameters(MethodCall call, Activity activity) {
        this.apiClientId = call.argument("apiClientID");
        this.apiSecret = call.argument("apiSecret");
        this.isS2S = call.argument("isS2S");
        this.userId = call.argument("userID");
        this.activity = activity;
    }
}
