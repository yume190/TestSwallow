import XCTest
@testable import FoundationX
@testable import _PythonString
@testable import Swallow
@testable import FoundationXDependency

final class TempTests: XCTestCase {
    func testTemp() {
        XCTAssertEqual(swallow(), 1)
        XCTAssertEqual(foundationX(), 2)
        XCTAssertEqual(python(), 3)
        XCTAssertEqual(dependency(), 4)
    }
}
