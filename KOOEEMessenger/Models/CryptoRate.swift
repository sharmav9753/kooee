import Foundation

struct FiatValue: Codable {
    let USD: Double
}

struct CryptoRate: Codable {
    let BTC: FiatValue
    let ETH: FiatValue
}
