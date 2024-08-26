import XCTest
@testable import FoundationX
// import FoundationX
@testable import Swallow
// import Swallow2

final class TempTests: XCTestCase {
    func testA() {
        XCTAssertEqual(swallow(), 1)
        XCTAssertEqual(foundationX(), 2)
    }
}
