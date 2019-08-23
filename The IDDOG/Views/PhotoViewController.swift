//
//  PhotoViewController.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 22/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoViewController: UIViewController {

    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        showBlurView()
        let tapOutsideKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissPhotoView))
        view.addGestureRecognizer(tapOutsideKeyboard)
    }
    
    func setupLayout() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func showBlurView() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    @objc func dismissPhotoView() {
        view.removeFromSuperview()
    }
}
