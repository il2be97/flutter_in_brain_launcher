//
//  ConfigureInBrainParameters.swift
//  flutter_in_brain_launcher
//
//  Created by Илья Клюкин on 8.02.23.
//

import Foundation

struct ConfigureInBrainParameters {
    let apiClientId: String
    let  apiSecret: String
    let userId: String
    let isS2S: Bool
    
    init?(dict: Dictionary<String, Any>) {
        guard let apiCliendId = dict.unwrap("apiClientID") as? String,
              let apiSecret = dict.unwrap("apiSecret") as? String,
              let userId = dict.unwrap("userID") as? String,
              let isS2S = dict.unwrap("isS2S") as? Bool else {
            return nil
        }
        self.apiClientId = apiCliendId
        self.apiSecret = apiSecret
        self.userId = userId
        self.isS2S = isS2S
    }
}
