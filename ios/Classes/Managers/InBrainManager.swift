//
//  InBrainManager.swift
//  flutter_in_brain_launcher
//
//  Created by Илья Клюкин on 8.02.23.
//

import Foundation
import InBrainSurveys

class InBrainManager {
    private let manager: InBrain
    private var nativeSurveyClosed: ((Bool) -> ())?
    
    static let shared = InBrainManager()
    
    private init() {
        manager = InBrain.shared
        manager.inBrainDelegate = self
    }
    
    
    func configure(params: ConfigureInBrainParameters) {
        manager.setInBrain(apiClientID: params.apiClientId, apiSecret: params.apiSecret, isS2S: params.isS2S)
        manager.set(userID: params.userId)
    }
    
    func showNativeSurve(params: ShowNativeInBrainParameters, completion: @escaping (Bool) -> ()) {
        manager.showNativeSurveyWith(id: params.id, searchId: params.searchId ?? "")
        nativeSurveyClosed = completion
    }

    func getNativeSurveys(succes: @escaping ([[String: Any]]) -> (), failed: @escaping (Error) -> ()) {
        manager.getNativeSurveys(filter: nil) { surveys in
            succes(surveys.map { $0.toJson() })
        } failed: { error in
            failed(error)
        }
    }
}

extension InBrainManager: InBrainDelegate {
    func surveysClosed(byWebView: Bool, completedSurvey: Bool, rewards: [InBrainSurveyReward]?) {
        nativeSurveyClosed?(completedSurvey)
    }
}

