//
//  DogsTableViewController.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import SwiftyJSON

class DogsTableViewController: UIViewController {

    let dogTypesList = ["husky", "hound", "pug", "labrador"]
    var dogsViewModel: DogsViewModel!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DogsTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "headerIdentifier")
        tableView.register(DogsTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dogsViewModel = DogsViewModel(delegate: self)
        for type in dogTypesList {
            dogsViewModel.getDogs(dogType: type)
        }
        setupLayout()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        setupTableViewLayout()
    }
    
    func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func showAlert(message: String) {
        let alertView = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(alertAction)
        present(alertView, animated: true, completion: nil)
    }
    
    @objc func showSelectedImage(imageURL: String) {
        let photoViewer = PhotoViewController()
        present(photoViewer, animated: true, completion: nil)
    }
}

extension DogsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48 
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerIdentifier") as! DogsTableViewHeader
        let currentDog = dogsViewModel.listOfDogs[section]
        headerView.bindData(dog: currentDog)
        return headerView
    }
}

extension DogsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dogsViewModel.listOfDogs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! DogsTableViewCell
        let currentDog = dogsViewModel.listOfDogs[indexPath.section]
        cell.bindData(dog: currentDog)
        return cell
    }
}

extension DogsTableViewController: DogsServiceDelegate {
    
    func getDogsSuccess(dog: JSON) {
        dogsViewModel.parseDog(json: dog)
        tableView.reloadData()
    }
    
    func getDogsFailure(_ errorMessage: String) {
        showAlert(message: errorMessage)
    }
}
