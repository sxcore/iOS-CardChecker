import SnapKit
import UIKit

class CreditCardControlView: UIView {

    let creditCardNumberTextField: UITextField = Factory.aCVCNumberTextField()
    let dateNumberTextField: UITextField = Factory.dateNumberTextField()
    let aCVCNumberTextField: UITextField = Factory.aCVCNumberTextField()

    init() {
        super.init(frame: .zero)

        addSubviews()
        configureAutolayout()
    }

    private func addSubviews() {
        addSubview(creditCardNumberTextField)
        addSubview(dateNumberTextField)
        addSubview(aCVCNumberTextField)
    }

    private func configureAutolayout() {
        creditCardNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }

        dateNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(creditCardNumberTextField)
        }

        aCVCNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(dateNumberTextField)
            make.right.equalTo(self)
        }
    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
