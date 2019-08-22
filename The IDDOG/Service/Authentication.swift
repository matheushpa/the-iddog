//
//  Authentication.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol AuthenticationDelegate {
    
    func authenticationSuccess(user: JSON)
    func authenticationFailure(_ errorMessage: String)
}

public class Authentication {
    
    var delegate: AuthenticationDelegate
    var userRequest: Request?
    
    required init(delegate: AuthenticationDelegate) {
        
        self.delegate = delegate
    }
    
    func signIn(email: String) {
        
        userRequest = RequestFactory.postLogin(email: email).validate().responseJSON { response in
            switch response.result {
            case .success:
                let userJSON = JSON(response.result.value as Any)
                self.delegate.authenticationSuccess(user: userJSON)
            case .failure:
                let errorMessage = self.errorHandler(response: response)
                self.delegate.authenticationFailure(errorMessage)
            }
        }
    }
    
    private func errorHandler<T: Any>(response: DataResponse<T>) -> String {
        
        if let httpResponse = response.response {
            if httpResponse.statusCode == 404 {
                return "Account doesn't exist or was not found."
            }
        } else {
            if let error = response.result.error as? URLError {
                if error.errorCode == -999 {
                    print("Request canceled!")
                }
                if error.errorCode == -1009 {
                    return "Network connection failure. Check your internet connection and try again later!"
                }
            }
        }
        return "Invalid email."
    }
}
