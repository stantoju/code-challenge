//
//  ApiRequestProtocol.swift
//  code-challenge
//
//  Created by Toju on 30/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    
    func getProfile(url: String, completion: @escaping (Result<Response, MockError>) -> ())
    
    func updateProfile(url: String, param: [String: Any], completion: @escaping (Result<Response, MockError>) -> ())
    
    func changePassword(url: String, param: [String: Any], completion: @escaping (Result<Response, MockError>) -> ())
    
}
