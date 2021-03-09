import Foundation
import UIKit

class WalletVC: CustomViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let imagePlus = UIImage(systemName: "camera")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: imagePlus,
            style: .plain, target: self, action: #selector(rightButtonClicked)
        )
        self.navigationItem.title = "KOOEE"
    }

    @objc override func rightButtonClicked() {

    }
}
