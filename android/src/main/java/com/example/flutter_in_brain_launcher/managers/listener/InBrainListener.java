package com.example.flutter_in_brain_launcher.managers.listener;

import com.example.flutter_in_brain_launcher.managers.InBrainManager;
import com.example.flutter_in_brain_launcher.managers.listener.callback.InBrainListenerCallback;
import com.inbrain.sdk.InBrain;
import com.inbrain.sdk.callback.InBrainCallback;
import com.inbrain.sdk.model.Reward;

import java.util.List;

public class InBrainListener {
    private static InBrainListener instance = null;
    public static InBrainListenerCallback inBrainCallback = null;

    private InBrainListener() {};

    public static InBrainListener start() {
        if (instance == null) {
            instance = new InBrainListener();

            final InBrain manager = InBrain.getInstance();
            manager.addCallback(new InBrainCallback() {
                @Override
                public void surveysClosed() {
                    if (inBrainCallback != null) {
                        inBrainCallback.onInBrainClosed();
                    }
                }

                @Override
                public void surveysClosedFromPage() {

                }

                @Override
                public boolean didReceiveInBrainRewards(List<Reward> list) {
                    return false;
                }
            });
        }
        return instance;
    }

    public static InBrainListener getInstance() {
        return instance;
    }
}
