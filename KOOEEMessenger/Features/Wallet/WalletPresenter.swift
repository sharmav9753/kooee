import Foundation

protocol WalletPresenterService: class {
    // Set bitcoin balance on UI
    func setBitcoinBalance(currentBalance: Double)
    // Set Bitcoin rate on UI
    func setBitcoinRate(bitcoinRate: BitcoinRate)
}

class WalletPresenter {

    //MARK: Variables

    weak var presenterService: WalletPresenterService?

    //MARK: Initialiser

    init(service: WalletPresenterService) {
        self.presenterService = service
        self.setupWallet()
    }

    //MARK: Helper methods

    private func setupWallet() {
        NetworkManager().getBalance(address: "1KbrSKrT3GeEruTuuYYUSQ35JwKbrAWJYm") { cryptoBalance, error in
            guard error == nil, let currentBalance = cryptoBalance?.final_balance else {
                return
            }
            self.presenterService?.setBitcoinBalance(currentBalance: currentBalance)
        }

        NetworkManager().getBitcoinRate() { bitcoinRate, error in
            guard error == nil, let _bitcoinRate = bitcoinRate else {
                return
            }
            self.presenterService?.setBitcoinRate(bitcoinRate: _bitcoinRate)
        }
    }
}
