import UIKit

extension UIView {
    func dlgpicker_setupRoundCorners() {
        self.layer.cornerRadius = min(bounds.size.height, bounds.size.width) / 2
    }
}
