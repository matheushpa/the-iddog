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
        return Alamofire.request("\(baseURL)signup/", method:.post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
    }
    
    static func getDogsFeed(dogType: String) -> DataRequest {
        let headers: HTTPHeaders = ["Authorization": token!,
                                    "Content-Type": "application/json"]
        return Alamofire.request("\(baseURL)feed/?category=\(dogType)", method:.get, encoding: JSONEncoding.default, headers: headers)
    }
}
