import XCTest
import InlineSnapshotTesting
@testable import SolbenchKit

final class CommonTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        isRecording = false
    }

    func test_joinWithColumnSeparator() {
        let sut = joinWithColumnSeparator(["a", "b", "c"])
        assertInlineSnapshot(of: sut, as: .lines) {
            """
            a | b | c
            """
        }
    }

    func test_joinWithLinebreak() {
        let sut = joinWithLinebreak(["a", "b", "c"])
        assertInlineSnapshot(of: sut, as: .lines) {
            """
            a
            b
            c
            """
        }
    }

    func test_tableComponentsToString() {
        let components = (["h1", "h2", "h3"], [["a1", "a2", "a3"], ["b1", "b2", "b3"]])
        let sut = tableComponentsToString(components)
        assertInlineSnapshot(of: sut, as: .lines) {
            """
            | h1 | h2 | h3 |
            | - | - | - |
            | a1 | a2 | a3 |
            | b1 | b2 | b3 |
            """
        }
    }

    func test_addTableEdge() {
        let sut = addTableEdge("hello")
        assertInlineSnapshot(of: sut, as: .lines) {
            """
            | hello |
            """
        }
    }

}
