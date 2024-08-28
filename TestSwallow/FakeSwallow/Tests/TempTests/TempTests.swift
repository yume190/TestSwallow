import XCTest
@testable import FoundationX
@testable import _PythonString
@testable import Swallow
@testable import FoundationXDependency

final class TempTests: XCTestCase {
    func testTemp() {
        XCTAssertEqual(swallow(), 2)
        XCTAssertEqual(foundationX(), 7)
        XCTAssertEqual(python(), 8)
        XCTAssertEqual(dependency(), 4)
    }
}
