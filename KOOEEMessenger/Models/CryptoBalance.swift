import Foundation

struct CryptoBalance: Codable {
    let address: String
    let total_received: Double?
    let total_sent: Double?
    let balance: Double?
    let unconfirmed_balance: Double?
    let final_balance: Double?
    let n_tx: Double?
    let unconfirmed_n_tx: Double?
    let final_n_tx: Double?
}
