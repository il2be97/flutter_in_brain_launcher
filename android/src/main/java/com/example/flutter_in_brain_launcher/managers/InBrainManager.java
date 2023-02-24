package com.example.flutter_in_brain_launcher.managers;

import com.example.flutter_in_brain_launcher.paramaters.ConfigureInBrainParameters;
import com.example.flutter_in_brain_launcher.paramaters.ShowNativeSurveyParameters;
import com.inbrain.sdk.InBrain;
import com.inbrain.sdk.callback.StartSurveysCallback;
import com.inbrain.sdk.model.Survey;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;


public class InBrainManager {
    final InBrain manager = InBrain.getInstance();

    public void configure(ConfigureInBrainParameters parameters) {
        manager.setInBrain(parameters.activity, parameters.apiClientId, parameters.apiSecret, parameters.isS2S, parameters.userId);
    }

    public  void getNativeSurvey(InBrainGetNativeSurveyCallback callback) {
        manager.getNativeSurveys(surveyList -> {
            List<HashMap<String, Object>> surveysMap = new ArrayList<HashMap<String, Object>>();
            for (Survey survey: surveyList) {
                surveysMap.add(convertSurveyToMap(survey));
            }
            callback.onSuccess(surveysMap);
        });
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

    HashMap<String, Object> convertSurveyToMap(Survey survey) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("id", survey.id);
        map.put("searchId", survey.searchId);
        map.put("rank", survey.rank);
        map.put("time", survey.time);
        map.put("value", survey.value);
        map.put("currencySale", survey.currencySale);
        map.put("multiplier", survey.multiplier);

        return map;
    }
}
