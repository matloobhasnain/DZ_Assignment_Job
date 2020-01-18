//
//  DZ_Test_iOSTests.swift
//  DZ_Test_iOSTests
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import XCTest
@testable import DZ_Test_iOS


class DZ_Test_iOSTests: XCTestCase {

     var mockNetworkLayer: NetworkLayer?
    override func setUp() {
        mockNetworkLayer = NetworkLayer.sharedInstance
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
    
    func testProductFetching() {
        
        let ex = expectation(description: "Expecting a JSON data not nil and product should be greator than 1")
        
       
        mockNetworkLayer?.fetchProduct(success: { (pr) in
            XCTAssertNotNil(pr)
            XCTAssertTrue(pr?.results?.count ?? 0 > 1)
            ex.fulfill()
        }, failure: { (error) in
            XCTFail("error: \(error ?? "")")
        })
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }

}
