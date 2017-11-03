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
            make.left.equalToSuperview().offset(10)
        }

        dateNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(creditCardNumberTextField.snp.right).offset(5)
            make.right.greaterThanOrEqualTo(aCVCNumberTextField.snp.left).offset(-10)
        }

        aCVCNumberTextField.snp.makeConstraints { make -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
