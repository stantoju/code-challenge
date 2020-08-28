//
//  UserRepo.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//

import Foundation

class UserRepo {
    
    func getProfile(url: String, completion: @escaping (Response?, Error?) -> ()) {
        HTTP.instance.getRequest(url: url, completion: { (data, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
           
            let res = try! JSONDecoder().decode(Response.self, from: data!)
            completion(res, nil)

        })
    }
    
    
    func handlePost(url: String, param: [String: Any], completion: @escaping (Response?, Error?) -> ()) {
        HTTP.instance.postRequest(param: param, url: url){ data, err in
            
            if let err = err {
                completion(nil, err)
                    return
                }
                      
              let res = try! JSONDecoder().decode(Response.self, from: data!)
                completion(res, nil)
        }
    }

}
