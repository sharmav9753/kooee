import Foundation
import BigInt

struct CryptoBalance: Codable {
      let address: String
      let total_received: BigUInt
      let total_sent: BigUInt
      let balance: BigUInt
      let unconfirmed_balance: Int
      let final_balance: BigUInt
      let n_tx: Int
      let unconfirmed_n_tx: Int
      let final_n_tx: Int
}
