//
//  DogsTableViewHeader.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit

class DogsTableViewHeader: UITableViewHeaderFooterView {

    let headerLabel = UILabel()
    let seeMoreButton = UIButton(type: .system)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    // MARK - Setup methods
    func setupLayout() {
        contentView.backgroundColor = .white
        setupSeeMoreButton()
        setupHeaderLabel()
    }
    
    func setupSeeMoreButton() {
        seeMoreButton.setTitleColor(.black, for: .normal)
        seeMoreButton.setTitle("See More", for: .normal)
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(seeMoreButton)
        seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        seeMoreButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupHeaderLabel() {
        headerLabel.textColor = .black
        headerLabel.numberOfLines = 1
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func bindData(dog: DogModel) {
        headerLabel.text = dog.category?.uppercased()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
