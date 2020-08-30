//
//  User.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//

import Foundation

class User: Codable {
    var firstName: String
    var userName: String
    var lastName: String
    
    init(firstName: String, userName: String, lastName: String) {
        self.firstName = firstName
        self.userName = userName
        self.lastName = lastName
    }
}
