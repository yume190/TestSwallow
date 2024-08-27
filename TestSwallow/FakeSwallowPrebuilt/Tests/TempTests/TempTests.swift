import XCTest
import FoundationX
import _PythonString
import Swallow
import FoundationXDependency

final class TempTests: XCTestCase {
    func testTemp() {
        XCTAssertEqual(swallow(), 1)
        XCTAssertEqual(foundationX(), 2)
        XCTAssertEqual(python(), 3)
        XCTAssertEqual(dependency(), 4)
    }
}
