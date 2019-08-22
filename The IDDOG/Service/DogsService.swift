//
//  DogsService.swift
//  The IDDOG
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 21/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol DogsServiceDelegate {
    func getDogsSuccess(dog: JSON)
    func getDogsFailure(_ errorMessage: String)
}

public class DogsService {
    
    var delegate: DogsServiceDelegate
    var dogRequest: Request?
    
    required init(delegate: DogsServiceDelegate) {
        self.delegate = delegate
    }
    
    func getDog(dogType: String) {
        dogRequest = RequestFactory.getDogsFeed(dogType: dogType).validate().responseJSON { response in
            switch response.result {
            case .success:
                let dogJSON = JSON(response.result.value as Any)
                self.delegate.getDogsSuccess(dog: dogJSON)
            case .failure:
                let errorMessage = self.errorHandler(response: response)
                self.delegate.getDogsFailure(errorMessage)
            }
        }
    }
    
    private func errorHandler<T: Any>(response: DataResponse<T>) -> String {
        if let httpResponse = response.response {
            if httpResponse.statusCode == 404 {
                return "Content doesn't exist or was not found."
            }
        } else {
            if let error = response.result.error as? URLError {
                if error.errorCode == -999 {
                    print("Request canceled!")
                }
                if error.errorCode == -1009 {
                    return "Network connection failure. Check your internet connection and try again later!"
                }
            }
        }
        return "Content not available."
    }
}
