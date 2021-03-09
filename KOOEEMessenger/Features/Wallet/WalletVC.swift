import Foundation
import UIKit

class WalletVC: CustomViewController {

    //MARK: Outlets

    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelBitcoinRate: UILabel!
    @IBOutlet weak var labelEthereumRate: UILabel!
    @IBOutlet weak var labelBTCBalanceInFiat: UILabel!
    @IBOutlet weak var labelETHBalanceInFiat: UILabel!

    //MARK: Variables

    private var presenter: WalletPresenter?

    //MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createRightBarItem()
        self.navigationItem.titleView = createTitleView()
        self.presenter = WalletPresenter(service: self)
    }

    //MARK: Private Helper methods

    private func createRightBarItem() {
        let imagePlus = UIImage(systemName: "camera")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: imagePlus,
            style: .plain, target: self, action: #selector(rightButtonClicked)
        )
        self.navigationItem.rightBarButtonItem?.tintColor = .black
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

    //MARK: Overriden methods

    @objc override func rightButtonClicked() {

    }
}

//MARK: - WalletPresenterService implementation

extension WalletVC: WalletPresenterService {

    func setBalanceInFiat(eth: String, btc: String) {
        DispatchQueue.main.async {
            self.labelBTCBalanceInFiat.text = btc
            self.labelETHBalanceInFiat.text = eth
        }
    }

    func setBtcBalance(balance: String) {
        DispatchQueue.main.async {
            self.labelBalance.text = balance
        }
    }

    func setRates(eth: String, btc: String) {
        DispatchQueue.main.async {
            self.labelBitcoinRate.text = btc
            self.labelEthereumRate.text = eth
        }
    }
}
