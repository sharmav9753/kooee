import Foundation
import UIKit

class MessagesVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(systemName: "line.horizontal.3")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain, target: self, action: #selector(showSettings)
        )
    }

    @objc func showSettings() {
        let settingsStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        self.navigationController?.present(
            settingsStoryboard.instantiateViewController(withIdentifier: "Settings"), animated: true
        )
    }
}
