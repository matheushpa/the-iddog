//
//  The_IDDOGTests.swift
//  The IDDOGTests
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 20/08/19.
//  Copyright © 2019 Matheus Holanda. All rights reserved.
//

import XCTest

@testable import The_IDDOG

class The_IDDOGTests: XCTestCase {
    
    let userViewModel: UserViewModel!
    
    func userTokenTest() {
        userViewModel.getCurrentUser()
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWQ1YWZhNmI0NzRkYWE2NzI2YjIwMTc3IiwiaWF0IjoxNTY2MjQzNDM1LCJleHAiOjE1Njc1Mzk0MzV9.JtrCSj3O-d3xcFlYuBSAE7bvIbPBoCxQmTMk0T4w1tY"
        let resultString = userViewModel.getCurrentUser()?.token
        XCTAssertEqual(resultString, token)
    }

    func dogsListTest() {
//        let headers: HTTPHeaders = [
//            "Authorization": token,
//            "Content-Type": "application/json"
//        ]
//        Alamofire.request("\(baseURL)feed", method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response: DataResponse<Any>) in
//            switch response.result {
//            case .success:
//                print(response.result.value)
//            case .failure:
//                print(response.data)
//                print(response.error as Any)
//            }
//        }
    }
}
