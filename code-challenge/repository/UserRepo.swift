//
//  UserRepo.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//

import Foundation

class UserRepo {
    
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
    
    
    func handlePost(url: String, param: [String: Any], completion: @escaping (Result<Response, Error>) -> ()) {
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
