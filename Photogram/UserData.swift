//
//  UserData.swift
//  Photogram
//
//  Created by Fatih Oğuz on 3.03.2024.
//

import Foundation
class UserData {
    static let shared = UserData()
    private init() {
        
    }
    var userName : String?
    var eMail : String?
    
    
    
}
