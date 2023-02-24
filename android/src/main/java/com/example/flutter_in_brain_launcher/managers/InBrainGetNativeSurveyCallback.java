package com.example.flutter_in_brain_launcher.managers;

import com.inbrain.sdk.model.Survey;

import java.util.HashMap;
import java.util.List;

public interface InBrainGetNativeSurveyCallback {
    void onSuccess(List<HashMap<String, Object>> list);
}
