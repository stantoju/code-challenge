//
//  Http.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//  Copyright © 2020 Ikeja Electric. All rights reserved.
//

import Foundation

class HTTP {
    
    static let instance = HTTP()
    
    let baseUrl = "https://api.foo.com/"
    let token = "Bearer thisIsAMockTokenValue1234567890thisIsAMockTokenValue1234567890"
    
        func postRequest(param: [String: Any], url: String, completion: @escaping (Data?, Error?) -> ()) {
            guard let url = URL(string: "\(baseUrl)\(url)")
                else { fatalError("Invalid URL") }
            let body = try! JSONSerialization.data(withJSONObject: param)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = body
            request.setValue(token, forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            }.resume()
        }
    
    
    
    func getRequest(url: String, completion: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: "\(baseUrl)\(url)") else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }.resume()
    }
    
}
