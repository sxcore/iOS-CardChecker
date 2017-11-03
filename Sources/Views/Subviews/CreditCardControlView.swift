import SnapKit
import UIKit

class CreditCardControlView: UIView {

    let creditCardNumberTextField: UITextField = Factory.creditCardNumberTextField()
    let dateNumberTextField: UITextField = Factory.dateNumberTextField()
    let aCVCNumberTextField: UITextField = Factory.aCVCNumberTextField()

    init() {
        super.init(frame: .zero)

        backgroundColor = UIColor.white
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
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(5)
        }

        dateNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.greaterThanOrEqualTo(creditCardNumberTextField.snp.right).offset(10)
        }

        aCVCNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.greaterThanOrEqualTo(dateNumberTextField.snp.right).offset(10)
            make.right.equalToSuperview().offset(5)
        }
    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
