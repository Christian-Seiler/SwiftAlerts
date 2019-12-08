import UIKit

extension UISegmentedControl {

    /// Font of titles
    func title(font: UIFont) {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        setTitleTextAttributes(attributes, for: UIControl.State())
        //setNeedsDisplay()
        //layoutIfNeeded()
    }

    /// Segments titles.
    var segmentTitles: [String?] {
        get {
            var titles: [String?] = []
            var index = 0
            while index < numberOfSegments {
                titles.append(titleForSegment(at: index))
                index += 1
            }
            return titles
        }
        set {
            removeAllSegments()
            for (index, title) in newValue.enumerated() {
                insertSegment(withTitle: title, at: index, animated: false)
            }
        }
    }

    /// Segments images.
    var segmentImages: [UIImage?] {
        get {
            var images: [UIImage?] = []
            var index = 0
            while index < numberOfSegments {
                images.append(imageForSegment(at: index))
                index += 1
            }
            return images
        }
        set {
            removeAllSegments()
            for (index, image) in newValue.enumerated() {
                insertSegment(with: image, at: index, animated: false)
            }
        }
    }
}
