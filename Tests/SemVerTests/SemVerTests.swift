@testable import SemVer
import XCTest

final class SemVerTests: XCTestCase {
    func testCompare() {
        XCTAssertLessThan(Version(major: 1, minor: 2, patch: 3), Version(major: 1, minor: 2, patch: 4))

        XCTAssertLessThan(Version(major: 1, minor: 2, patch: 3), Version(major: 1, minor: 3))

        XCTAssertLessThan(Version(major: 1, minor: 2, patch: 3), Version(major: 2))
    }

    func testString() {
        XCTAssertNil(Version(""))
        XCTAssertNil(Version("1,"))
        XCTAssertNil(Version("1.2.q"))
        XCTAssertNil(Version("1.2.3.5"))

        XCTAssertEqual(Version(major: 1, minor: 2, patch: 3), Version("1.2.3"))
        XCTAssertEqual(Version(major: 1, minor: 2), Version("1.2"))
        XCTAssertEqual(Version(major: 1), Version("1"))

        XCTAssertEqual(String(Version(major: 1, minor: 2, patch: 3)), "1.2.3")
    }

    static var allTests = [
        ("testCompare", testCompare),
        ("testString", testString),
    ]
}
