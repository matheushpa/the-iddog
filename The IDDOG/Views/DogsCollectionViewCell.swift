//
//  DogsCollectionViewCell.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import AlamofireImage

class DogsCollectionViewCell: UICollectionViewCell {
    
    let dogImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageViewLayout()
    }
    
    func setupImageViewLayout() {
        dogImageView.af_setImage(withURL: URL(string: "https://images.dog.ceo/breeds/hound-english/n02089973_1106.jpg")!, runImageTransitionIfCached: true, completion: { (image) in
//            self.errorReloadView.isHidden = true
//            self.hideAnimation(loadingView: self.loadingView)
        })
        dogImageView.contentMode = .scaleAspectFill
        dogImageView.layer.cornerRadius = 5.0
        dogImageView.clipsToBounds = true
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dogImageView)
        dogImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dogImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dogImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        dogImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
