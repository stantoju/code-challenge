//
//  Response.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//

import Foundation

struct Response: Codable {
    var message: String
    var data: User?
    var code: String?
    var exceptionName: String?
}
