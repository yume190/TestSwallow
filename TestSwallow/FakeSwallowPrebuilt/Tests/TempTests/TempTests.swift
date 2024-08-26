import XCTest
// @testable import FoundationX_Aggr
import FoundationX
// @testable import Swallow2_Aggr
import Swallow

final class TempTests: XCTestCase {
    func testA() {
        print(123)
        XCTAssertEqual(swallow(), 1)
        XCTAssertEqual(foundationX(), 2)
    }
}
