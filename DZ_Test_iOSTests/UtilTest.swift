import XCTest
@testable import DZ_Test_iOS
import Foundation

class UtilTest: XCTestCase {
    
    var mockUtil: Dzutil?
    
    override func setUp() {
        mockUtil = Dzutil.sharedInstance
    }
    
    override func tearDown() {
        
    }
    
    func testValidateURL() {
        XCTAssertTrue(mockUtil?.validatURL(url: Constants.URL.completeURLWithEndPoints) ?? false)
    }
    
    
}
