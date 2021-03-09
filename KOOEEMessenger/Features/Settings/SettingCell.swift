import Foundation
import UIKit

class SettingCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewSetting: UIImageView!
    @IBOutlet weak var textViewSetting: UITextField!

    // MARK: Helper methods

    func setupCell(title: String, image: UIImage? = nil, settingInfo: String? = nil) {
        self.labelTitle.text = title
        self.imageView?.image = image
        self.textViewSetting.text = settingInfo
    }
}
