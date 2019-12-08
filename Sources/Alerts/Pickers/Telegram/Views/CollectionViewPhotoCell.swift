import UIKit

public final class CollectionViewPhotoCell: CollectionViewCustomContentCell<UIImageView> {

    public var isLoading: Bool = false {
        didSet {
            setupLoadingIndicatorIfNeeded()
            if isLoading {
                loadingIndicator.startAnimating()
            } else {
                loadingIndicator.stopAnimating()
            }
        }
    }

    private var loadingIndicator = UIActivityIndicatorView(style: .gray)

    override public func layoutSubviews() {

        super.layoutSubviews()

        loadingIndicator.sizeToFit()
        loadingIndicator.center = self.contentView.center
    }

    override public func prepareForReuse() {
        super.prepareForReuse()
        customContentView.image = nil
    }

    private func setupLoadingIndicatorIfNeeded() {
        if loadingIndicator.superview != contentView {
            loadingIndicator.hidesWhenStopped = true
            contentView.addSubview(loadingIndicator)
        }
    }

}
