//
//  IBrainSurveyDecoder.swift
//  flutter_in_brain_launcher
//
//  Created by Илья Клюкин on 24.02.23.
//

import Foundation
import InBrainSurveys

extension InBrainNativeSurvey {
    func toJson() -> [String: Any] {
        return [
            "id": id,
            "searchId": searchId,
            "rank": rank,
            "time": time,
            "value": value,
            "currencySale": currencySale,
            "multiplier": multiplier
        ]
    }
}
