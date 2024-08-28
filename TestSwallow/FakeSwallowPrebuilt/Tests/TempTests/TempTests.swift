import XCTest
import FoundationX
import _PythonString
import Swallow
import FoundationXDependency

final class TempTests: XCTestCase {
    func testTemp() {
        XCTAssertEqual(swallow(), 2)
        XCTAssertEqual(foundationX(), 7)
        XCTAssertEqual(python(), 8)
        XCTAssertEqual(dependency(), 4)
    }
}
