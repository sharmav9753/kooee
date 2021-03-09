import Foundation
import UIKit

class CustomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageSettings = UIImage(systemName: "line.horizontal.3")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: imageSettings,
            style: .plain, target: self, action: #selector(showSettings)
        )
        let imagePlus = UIImage(systemName: "plus")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: imagePlus,
            style: .plain, target: self, action: #selector(rightButtonClicked)
        )
    }

    @objc func showSettings() {
        let settingsStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        self.navigationController?.present(
            settingsStoryboard.instantiateViewController(withIdentifier: "Settings"), animated: true
        )
    }

    @objc func rightButtonClicked() {

    }
}
