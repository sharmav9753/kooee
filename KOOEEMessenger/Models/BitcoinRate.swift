import Foundation

struct BitcoinRate: Codable {
    let USD: BitcoinRateTypes
}

struct BitcoinRateTypes: Codable {
    let m15: Double?
    let last: Double?
    let buy: Double?
    let sell: Double?
    let symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case m15 = "15m"
        case last
        case buy
        case sell
        case symbol
    }
}
