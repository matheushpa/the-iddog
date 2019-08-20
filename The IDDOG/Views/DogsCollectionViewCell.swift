//
//  DogsCollectionViewCell.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit

class DogsCollectionViewCell: UICollectionViewCell {
    
    let dogImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageViewLayout()
    }
    
    func setupImageViewLayout() {
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
//        dogImageView.layer.cornerRadius = 10.0
        dogImageView.contentMode = .scaleAspectFill
        dogImageView.image = UIImage(named: "husky")
        addSubview(dogImageView)
        dogImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: frame.height).isActive = true
        dogImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: frame.width).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
