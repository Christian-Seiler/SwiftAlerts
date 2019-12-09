import UIKit

extension UIAlertController {

    /// Add a textField
    ///
    /// - Parameters:
    ///   - height: textField height
    ///   - hInset: right and left margins to AlertController border
    ///   - vInset: bottom margin to button
    ///   - configuration: textField

    public func addOneTextField(configuration: TextField.Config?) {
        let textField = OneTextFieldViewController(vInset: preferredStyle == .alert ? 12 : 0, configuration: configuration)
        let height: CGFloat = OneTextFieldViewController.UI.height + OneTextFieldViewController.UI.vInset
        set(viewController: textField, height: height)
    }
}

public final class OneTextFieldViewController: UIViewController {

    fileprivate lazy var textField: TextField = TextField()

    struct UI {
        static let height: CGFloat = 44
        static let hInset: CGFloat = 12
        static var vInset: CGFloat = 12
    }

    public init(vInset: CGFloat = 12, configuration: TextField.Config?) {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(textField)
        UI.vInset = vInset

        /// have to set textField frame width and height to apply cornerRadius
        textField.frame.size = .init(width: UI.height, height: view.frame.width)

        configuration?(textField)

        preferredContentSize.height = UI.height + UI.vInset
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        Log("has deinitialized")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        textField.frame.size.width = view.frame.width - UI.hInset * 2
        textField.frame.size.height = UI.height
        textField.center.x = view.center.x
        textField.center.y = view.center.y - UI.vInset / 2
    }
}
