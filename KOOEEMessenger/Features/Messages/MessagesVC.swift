import Foundation
import UIKit

class MessagesVC: CustomViewController {

    //MARK: Outlets

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    //MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.title = Strings.MESSAGES
    }
}
