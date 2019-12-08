import XCTest
@testable import Alerts

final class AlertsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Alerts().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
