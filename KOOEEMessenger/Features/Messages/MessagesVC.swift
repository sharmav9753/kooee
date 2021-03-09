import Foundation
import UIKit

class MessagesVC: CustomViewController {

    //MARK: Outlets

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    //MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControl.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 20)], for: .normal)
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.title = "Messages"
    }
}
