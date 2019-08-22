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
    
//    let dogsViewModel: [DogModel] = []
    
    var dog: DogModel?
    
    func parseDog(json: JSON) -> DogModel? {
        
        dog = DogModel()
        dog?.category = json["category"].string
        if let list = json["list"].array {
            print(list)
        }
        return dog
    }
}
