//
//  NetworkLayerTest.swift
//  DZ_Test_iOSTests
//
//  Created by PureLogics on 18/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//
import XCTest
@testable import DZ_Test_iOS
import Foundation

class NetworkLayerTest: XCTestCase {
    
    var mockNetworkLayer: NetworkLayer?
    
    override func setUp() {
        mockNetworkLayer = NetworkLayer.sharedInstance
    }
    
    override func tearDown() {
    
    }
   
    
    func testJsonIsNotNill() {
        
        let ex = expectation(description: "Expecting a JSON data not nil")
            mockNetworkLayer?.fetchProduct(success: { (pr) in
            XCTAssertNotNil(pr)
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
    
    func testProductsAreGreaterThan1() {
        
        let ex = expectation(description: "Expecting a JSON data not nil")
        mockNetworkLayer?.fetchProduct(success: { (pr) in
            
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
