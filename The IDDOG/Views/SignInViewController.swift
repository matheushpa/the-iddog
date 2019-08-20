//
//  SignInViewController.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    let yourEmail = "your email"
    let emailTextField = UITextField()
    let appNameLabel = UILabel()
    let lineView = UIView()
    let loginButton = UIButton(type: .system)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLayout()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        setupEmailTextField()
        setupAppNameLabel()
        setupLineView()
        setupLoginButton()
    }
    
    func setupEmailTextField() {
        emailTextField.placeholder = yourEmail
        emailTextField.textAlignment = .center
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.textColor = .black
        emailTextField.tintColor = .black
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 256).isActive = true
        view.addSubview(emailTextField)
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupAppNameLabel() {
        let firstTitleText = "T H E"
        let secondTitleText  = "  I D D O G"
        let attributedString = NSMutableAttributedString(string: firstTitleText)
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        let boldString = NSMutableAttributedString(string: secondTitleText, attributes: attributes)
        attributedString.append(boldString)
        appNameLabel.attributedText = attributedString
        appNameLabel.textColor = .black
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appNameLabel)
        appNameLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -80).isActive = true
        appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLineView() {
        lineView.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 256).isActive = true
        view.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4).isActive = true
        lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.backgroundColor = .black
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("L O G I N", for: .normal)
        loginButton.layer.cornerRadius = 5.0
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 232).isActive = true
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 80).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func showAlert() {
        let alertView = UIAlertController(title: "Alerta", message: "Fill up with a valid email!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(alertAction)
        present(alertView, animated: true, completion: nil)
    }
    
    @objc func loginPressed() {
        if let email = emailTextField.text {
            if email.isEmpty {
                showAlert()
            } else {
                let nextViewController = DogsTableViewController()
                present(nextViewController, animated: true, completion: nil)
            }
        }
    }
}
