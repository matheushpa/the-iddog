//
//  RequestFactory.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import Alamofire
import SwiftKeychainWrapper

let baseURL = "https://api-iddog.idwall.co/"
let token = KeychainWrapper.standard.string(forKey: "Token")

class RequestFactory {
    
    static func postLogin(email: String) -> DataRequest {
        
        let parameters: Parameters = ["email": email]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        return Alamofire.request("\(baseURL)signup", method:.post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
    }
    
    static func getDogsFeed(dogType: String) -> DataRequest {
        
        print(token) // FIX TOKEN
//        let parameters: Parameters = ["category": "hound"]
        let headers: HTTPHeaders = ["Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWQ1YWZhNmI0NzRkYWE2NzI2YjIwMTc3IiwiaWF0IjoxNTY2MjQzNDM1LCJleHAiOjE1Njc1Mzk0MzV9.JtrCSj3O-d3xcFlYuBSAE7bvIbPBoCxQmTMk0T4w1tY",
                                    "Content-Type": "application/json"]
        return Alamofire.request("\(baseURL)feed", method:.get, encoding: JSONEncoding.default, headers: headers)
    }
}
