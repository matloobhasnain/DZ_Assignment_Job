//
//  DZ_Test_iOSUITests.swift
//  DZ_Test_iOSUITests
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import XCTest
@testable import DZ_Test_iOS

class DZ_Test_iOSUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {

    }

    func testExample() {

    }
    

    func testTableViewNotNil() {
        
        let app = XCUIApplication()
        XCTAssertEqual(app.tables.count, 1)
        let table = app.tables.element(boundBy: 0)
        XCTAssertNotNil(table)
    }

    }
