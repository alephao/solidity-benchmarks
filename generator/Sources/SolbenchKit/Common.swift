import Foundation
import Prelude

struct ReadFile {
    let path: String
}

struct WriteFile {
    let path: String
    let contents: String
}

func pathToData(_ path: String) -> Data {
    try! String(contentsOfFile: path).data(using: .utf8)!
}

func read(_ rf: ReadFile) -> Data {
    pathToData(rf.path)
}

func write(_ wf: WriteFile) -> Void {
    try! wf.contents.write(
        toFile: wf.path,
        atomically: true,
        encoding: .utf8
    )
}

func joinWithColumnSeparator(_ cols: [String]) -> String { cols.joined(separator: " | ") }

func joinWithLinebreak(_ lines: [String]) -> String { lines.joined(separator: "\n") }

func addTableEdge(_ str: String) -> String { "| \(str) |" }

func tableComponentsToString(_ components: (head: [String], body: [[String]])) -> String {
    (
        [
            components.head,
            components.head.map(const("-")),
        ]
        + components.body
    )
    |> map(joinWithColumnSeparator >>> addTableEdge)
    >>> joinWithLinebreak
}
