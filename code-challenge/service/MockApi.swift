//
//  MockApi.swift
//  code-challenge
//
//  Created by Toju on 30/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import Foundation

class MockAPI {
    
    var user = User(firstName: "Johnny B", userName: "iOS User", lastName: "Goode")

    
}


extension MockAPI: RequestProtocol {
    
   func getProfile(url: String, completion: @escaping (Result<Response, MockError>) -> ()) {
        
        let response = Response( message:"User Retrieved", data: user)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success(response))
        }
    }
    
    func updateProfile(url: String, param: [String : Any], completion: @escaping (Result<Response, MockError>) -> ()) {
        
        var response: Response
        if  (param["firstName"] as! String).isEmpty || (param["lastName"] as! String).isEmpty  {
            response = Response(message: "All fields are compulsory")
            completion(.failure(MockError.fieldRequired(err: response)))
            return
        }

        self.user.firstName = param["firstName"] as! String
        self.user.lastName = param["lastName"] as! String
        response = Response( message: "User Retrieved", data: self.user)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success(response))
        }
    }
    
    
    func changePassword(url: String, param: [String : Any], completion: @escaping (Result<Response, MockError>) -> ()) {
        
        var response: Response
        
        if  (param["currentPassword"] as! String).isEmpty ||
            (param["newPassword"] as! String).isEmpty   ||
            (param["confirmPassword"] as! String).isEmpty  {
            response = Response(message: "All fields are compulsory")
            completion(.failure(MockError.fieldRequired(err: response)))
            return
        }
        
        
        if  param["newPassword"] as! String != param["confirmPassword"] as! String {
            response = Response(message: "New Password and Confirm Password dont match")
            completion(.failure(MockError.noMatch(err: response)))
            return
        }
        
           response = Response(message: "Password Changed", code:"Success")

        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                completion(.success(response))
            }

    }
    
    
}

