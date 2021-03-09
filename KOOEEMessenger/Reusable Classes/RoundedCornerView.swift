import Foundation
import UIKit

@IBDesignable
class RoundedCornerView: UIView {

    //MARK: Variables

    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
