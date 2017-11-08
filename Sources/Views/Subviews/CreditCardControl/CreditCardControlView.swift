import SnapKit
import UIKit

class CreditCardControlView: UIView {

    let creditCardNumberTextField: CreditCardNumberTextField = Factory.creditCardNumberTextField()
    let dateNumberTextField: DateTextField = Factory.dateNumberTextField()
    let aCVCNumberTextField: CVCTextField = Factory.aCVCNumberTextField()

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
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(175)
        }

        dateNumberTextField.snp.makeConstraints { make -> Void in
            make.top.bottom.equalToSuperview()
            make.left.greaterThanOrEqualTo(creditCardNumberTextField.snp.right).offset(20)
            make.right.equalTo(aCVCNumberTextField.snp.left).offset(-20)
            make.width.equalTo(55)
        }

        aCVCNumberTextField.snp.makeConstraints { make -> Void in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
            make.width.equalTo(40)
        }
    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
