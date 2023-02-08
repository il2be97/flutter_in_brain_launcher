package com.example.flutter_in_brain_launcher.managers;

import com.example.flutter_in_brain_launcher.paramaters.ConfigureInBrainParameters;
import com.example.flutter_in_brain_launcher.paramaters.ShowNativeSurveyParameters;
import com.inbrain.sdk.InBrain;
import com.inbrain.sdk.callback.StartSurveysCallback;


public class InBrainManager {
    final InBrain manager = InBrain.getInstance();

    public void configure(ConfigureInBrainParameters parameters) {
        manager.setInBrain(parameters.activity, parameters.apiClientId, parameters.apiSecret, parameters.isS2S, parameters.userId);
    }

    public void showNativeSurvey(ShowNativeSurveyParameters parameters, InBrainShowNativeSurveyCallback callback) {
        manager.showNativeSurveyWith(parameters.activity, parameters.id, parameters.searchId, new StartSurveysCallback() {
            @Override
            public void onSuccess() {
                callback.onSuccess();
            }

            @Override
            public void onFail(String s) {
                callback.onFail(s);
            }
        });
    }
}
