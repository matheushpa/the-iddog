//
//  UserViewModel.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftKeychainWrapper

class UserViewModel {
    
    private var user: UserModel?
    private var userService: Authentication!
    
    init(delegate: AuthenticationDelegate) {
        userService = Authentication(delegate: delegate)
    }
    
    func getUser(email: String) {
        userService.signIn(email: email)
    }
    
    func getCurrentUser() -> UserModel? {
        return self.user
    }
    
    func parseUser(json: JSON) {
        user = UserModel()
        let currentUser = json["user"].dictionary
        user?.email = currentUser?["email"]?.string
        user?.id = currentUser?["_id"]?.string
        user?.token = currentUser?["token"]?.string
        if let token = user?.token {
            KeychainWrapper.standard.set(token, forKey: "Token")
        }
    }
}
