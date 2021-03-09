import Foundation

protocol WalletPresenterService: class {
    // Set btc balance on UI
    func setBtcBalance(balance: String)
    // Set Crypto rates on UI
    func setRates(eth: String, btc: String)
    // Set balance in fiat UI
    func setBalanceInFiat(eth: String, btc: String)
}

class WalletPresenter {

    //MARK: Variables

    weak var presenterService: WalletPresenterService?

    private var btcBalance: Double? {
        didSet {
            guard let _btcBalance = self.btcBalance else { return }
            self.presenterService?.setBtcBalance(
                balance: Helper.getBalanceForDisplay(value: _btcBalance, type: .BTC)
            )
            calculateFiatBalance()
        }
    }

    private var ethBalance: Double? {
        didSet {
            guard let _ = self.ethBalance else { return }
            calculateFiatBalance()
        }
    }

    private var rate: CryptoRate? {
        didSet {
            calculateFiatBalance()
        }
    }

    //MARK: Initialiser

    init(service: WalletPresenterService) {
        self.presenterService = service
        self.setupWallet()
    }

    //MARK: Helper methods

    private func setupWallet() {
        NetworkManager().getBalance(address: "1KbrSKrT3GeEruTuuYYUSQ35JwKbrAWJYm") { cryptoBalance, error in
            guard error == nil, let currentBalance = cryptoBalance?.final_balance else { return }
            self.btcBalance = (currentBalance/100000000)
        }

        NetworkManager().getCryptoRates() { rate, error in
            guard error == nil, let _rate = rate else { return }

            self.rate = _rate

            let btcRate = Helper.getBalanceForDisplay(value: _rate.BTC.USD, type: .USD)
            let ethRate = Helper.getBalanceForDisplay(value: _rate.ETH.USD, type: .USD)

            self.presenterService?.setRates(
                eth: "\(ethRate)/\(CurrencyType.ETH.symbol)",
                btc: "\(btcRate)/\(CurrencyType.BTC.symbol)"
            )
        }
    }

    private func calculateFiatBalance() {
        var btc: String = Strings.BALANCE_PLACEHOLDER + " " + CurrencyType.USD.symbol
        var eth: String = Strings.BALANCE_PLACEHOLDER + " " + CurrencyType.USD.symbol

        if let _btcBalance = self.btcBalance, let _rate = self.rate {
            btc = Helper.getBalanceForDisplay(value: _btcBalance * _rate.BTC.USD, type: .USD)
        }

        if let _ethBalance = self.ethBalance, let _rate = self.rate {
            eth = Helper.getBalanceForDisplay(value: _ethBalance * _rate.ETH.USD, type: .USD)
        }

        self.presenterService?.setBalanceInFiat(eth: eth, btc: btc)
    }
}
