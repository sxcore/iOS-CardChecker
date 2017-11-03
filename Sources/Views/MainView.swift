import SnapKit
import UIKit

public class MainView: UIView {

    let stackView: UIStackView = Factory.stackView()

    let validationIndicatorView: ValidationIndicatorView = Factory.validationIndicatorView()
    let creditCardControlView: CreditCardControlView = Factory.creditCardControlView()
    let generateButton: UIButton = Factory.generateButton()
    let validateButton: UIButton = Factory.validateButton()

    public init() {
        super.init(frame: .zero)

        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        addSubviews()
        configureAutolayout()
    }

    private func addSubviews() {
        stackView.addArrangedSubview(validationIndicatorView)
        stackView.addArrangedSubview(creditCardControlView)
        stackView.addArrangedSubview(generateButton)
        stackView.addArrangedSubview(validateButton)
        addSubview(stackView)

    }

    private func configureAutolayout() {
        stackView.snp.makeConstraints { make -> Void in
            make.left.right.centerY.equalToSuperview()
        }

        validationIndicatorView.snp.makeConstraints { make -> Void in
            make.height.equalTo(100)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        creditCardControlView.snp.makeConstraints { make -> Void in
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        generateButton.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
        validateButton.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }

    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
