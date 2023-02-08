//
//  UnwrapDictionary.swift
//  flutter_in_brain_launcher
//
//  Created by Илья Клюкин on 8.02.23.
//

import Foundation

extension Dictionary {
    func unwrap(_ key: Key) -> Value? {
         if let index = index(forKey: key){
             return self.values[index]
         }
         return nil
     }
}
