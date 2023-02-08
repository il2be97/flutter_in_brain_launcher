//
//  ShowNativeInBrainParameters.swift
//  flutter_in_brain_launcher
//
//  Created by Илья Клюкин on 8.02.23.
//

import Foundation

struct ShowNativeInBrainParameters {
    let id: String
    let searchId: String?
    
    init?(dict: Dictionary<String, Any>) {
        guard let id = dict.unwrap("id") as? String else {
            return nil
        }
        self.id = id
        self.searchId =  dict.unwrap("searchId") as? String
    }
}
