import Foundation

struct GasSnapshots: Decodable {
    let ERC20: ERC20.Dict
}

func decodeGasSnapshot(data: Data) -> GasSnapshots {
    try! JSONDecoder().decode(GasSnapshots.self, from: data)
}
