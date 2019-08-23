//
//  NavigationViewController.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class NavigationViewController: UINavigationController {
    
    private let signInViewController = SignInViewController()
    private let feedViewController = DogsTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userIsLoggedIn() {
            viewControllers = [feedViewController]
        } else {
            perform(#selector(goToSignInViewController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func userIsLoggedIn() -> Bool {
        if KeychainWrapper.standard.string(forKey: "Token") == nil {
            return false
        } else {
            return true
        }
    }
    
    @objc func goToSignInViewController() {
        present(signInViewController, animated: true, completion: nil)
    }
}
