//
//  RealAPi.swift
//  code-challenge
//
//  Created by Toju on 30/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import Foundation

class RealAPI {
    func getProfile(url: String, completion: @escaping (Result<Response, Error>) -> ()) {
        HTTP.instance.getRequest(url: url, completion: { result in
            
            switch result {
            case .success(let data):
                do {
                    let res = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(res))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            case .failure(let err):
                completion(.failure(err))
            }

        })
    }
    
    func updateProfile(url: String, param: [String : Any], completion: @escaping (Result<Response, Error>) -> ()) {
        HTTP.instance.postRequest(param: param, url: url){ result in
            
            switch result {
            case .success(let data):
                do {
                    let res = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(res))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func changePassword(url: String, param: [String : Any], completion: @escaping (Result<Response, Error>) -> ()) {
        
        HTTP.instance.postRequest(param: param, url: url){ result in
            
            switch result {
            case .success(let data):
                do {
                    let res = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(res))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    
    
}
