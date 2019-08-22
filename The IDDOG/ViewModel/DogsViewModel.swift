//
//  DogsViewModel.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import Foundation
import SwiftyJSON

class DogsViewModel {
    
    public var listOfDogs: [DogModel] = []
    private var dog: DogModel?
    private var dogService: DogsService!
    
    init(delegate: DogsServiceDelegate) {
        dogService = DogsService(delegate: delegate)
    }
    
    func getDogs(dogType: String) {
        dogService.getDog(dogType: dogType)
    }
    
    func parseDog(json: JSON) {
        dog = DogModel()
        dog?.category = json["category"].string
        if let imageList = json["list"].array {
            for position in 0..<(imageList.count) {
                if let image = imageList[position].string {
                    dog?.imagesList.append(image)
                }
            }
        }
        listOfDogs.append(dog!)
    }
}
