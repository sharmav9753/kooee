import Foundation
import UIKit

class WalletVC: CustomViewController {

    //MARK: Outlets

    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelBitcoinRate: UILabel!
    @IBOutlet weak var labelAccountBalance: UILabel!

    //MARK: Variables

    private var currentBitcoinBalance: Double!
    private var lastBitcoinRate: Double!
    private var presenter: WalletPresenter?

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let imagePlus = UIImage(systemName: "camera")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: imagePlus,
            style: .plain, target: self, action: #selector(rightButtonClicked)
        )
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationItem.titleView = createTitleView()
        self.presenter = WalletPresenter(service: self)
    }
    
    private func createTitleView() -> UIView {
        let titleLabel = UILabel()
        let color = UIColor.black
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: color,
            .kern : 10.0
        ]
        titleLabel.attributedText = NSAttributedString(string: "KOOEE", attributes: attributes)
        titleLabel.sizeToFit()
        return titleLabel
    }

    @objc override func rightButtonClicked() {

    }
}

//MARK: WalletPresenterService implementation
extension WalletVC: WalletPresenterService {

    func setBitcoinBalance(currentBalance: Double) {
        DispatchQueue.main.async {
            self.currentBitcoinBalance = (currentBalance/100000000)
            self.labelBalance.text = NSString.init(format: "%.2f", self.currentBitcoinBalance) as String
            if self.lastBitcoinRate != nil {
                self.labelAccountBalance.text = (self.lastBitcoinRate * self.currentBitcoinBalance).description
            }
        }
    }

    func setBitcoinRate(bitcoinRate: BitcoinRate) {
        guard let lastRate = bitcoinRate.USD.last, let symbol = bitcoinRate.USD.symbol else {
            return
        }
        DispatchQueue.main.async {
            self.labelBitcoinRate.text = lastRate.description + " " + symbol + " / BTC"
            self.lastBitcoinRate = lastRate
            if self.currentBitcoinBalance != nil {
                self.labelAccountBalance.text = (self.lastBitcoinRate * self.currentBitcoinBalance).description
            }
        }
    }
}
