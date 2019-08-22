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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func loginTest() {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        let parameters: Parameters = ["email": "matheusxiao@gmail.com"]
        let url = "https://api-iddog.idwall.co/feed/"
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWQ1YWZhNmI0NzRkYWE2NzI2YjIwMTc3IiwiaWF0IjoxNTY2MjQzNDM1LCJleHAiOjE1Njc1Mzk0MzV9.JtrCSj3O-d3xcFlYuBSAE7bvIbPBoCxQmTMk0T4w1tY"
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success:
                print(response.result.value)
            case .failure:
                print(response.error as Any)
            }
        }
    }
    
    func dogsListTest() {
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Content-Type": "application/json"
        ]
        Alamofire.request("\(baseURL)feed", method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success:
                print(response.result.value)
            case .failure:
                print(response.data)
                print(response.error as Any)
            }
        }
    }
}
