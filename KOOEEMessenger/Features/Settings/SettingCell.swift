import Foundation
import UIKit

class SettingCell: UITableViewCell {

    //MARK: Outlets

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewSetting: UIImageView!
    @IBOutlet weak var textViewSetting: UITextField!
    @IBOutlet weak var inputField: UITextField!
    
    //MARK: Helper methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelTitle.text = ""
        imageViewSetting.isHidden = true
        textViewSetting.isHidden = true
        inputField.isHidden = true
        // Initialization code
    }
    
    func setupCell(data: SettingItem) {
        self.labelTitle.text = data.title
        switch data.type {
        case .ICON:
            if let icon = data.icon {
                self.imageViewSetting.image = UIImage.init(systemName: icon) ?? UIImage.init(systemName: icon)
                self.imageViewSetting.isHidden = false
            }
        case .TEXT:
            inputField.text = data.value
            inputField.isSecureTextEntry = false
            inputField.isHidden = false
        case .PASS:
            inputField.text = data.value
            inputField.isSecureTextEntry = true
            inputField.isHidden = false
        default:
            break;
        }
    }
}
