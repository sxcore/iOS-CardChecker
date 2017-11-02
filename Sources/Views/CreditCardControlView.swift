import SnapKit
import UIKit

class CreditCardControlView: UIView {

    init() {
        super.init(frame: .zero)

        addSubviews()
        configureAutolayout()
    }

    private func addSubviews() {

    }

    private func configureAutolayout() {

    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CreditCardControlView {

    struct Factory {

        static func creditCardNumberTextField() -> UITextField {
            let creditCardNumberTextField = UITextField()
            return creditCardNumberTextField
        }

        static func dateNumberTextField() -> UITextField {
            let dateNumberTextField = UITextField()
            return dateNumberTextField
        }

        static func aCVCNumberTextField() -> UITextField {
            let aCVCNumberTextField = UITextField()
            return aCVCNumberTextField
        }
    }

}
