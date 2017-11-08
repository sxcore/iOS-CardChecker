import SnapKit
import UIKit

protocol CreditCardNumberDelegate: class {
    func validationButtonClicked(string: String)
}

public class MainView: UIView {

    let stackView: UIStackView = Factory.stackView()

    let containerView: UIView = Factory.containerView()
    let validationPendingView: ValidationIndicatorView = Factory.validationPendingView()
    let validationPositiveView: ValidationIndicatorView = Factory.validationPositiveView()
    let validationNegativeView: ValidationIndicatorView = Factory.validationNegativeView()

    let creditCardControlView: CreditCardControlView = Factory.creditCardControlView()

    let generateButton: UIButton = Factory.generateButton()
    let validateButton: UIButton = Factory.validateButton()

    weak var delegate: CreditCardNumberDelegate?

    var onValidateButtonTapped: (() -> Void)?

    public init() {
        super.init(frame: .zero)

        addSubviews()
        configureAutolayout()
        setUpGestureRecognition()
    }

    private func addSubviews() {
        addSubview(backgroundView)
        containerView.addSubview(validationPendingView)
        containerView.addSubview(validationPositiveView)
        containerView.addSubview(validationNegativeView)
        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(creditCardControlView)
        stackView.addArrangedSubview(generateButton)
        stackView.addArrangedSubview(validateButton)
        addSubview(stackView)

    }

    private func configureAutolayout() {
        backgroundView.snp.makeConstraints { make -> Void in
            make.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make -> Void in
            make.left.right.centerY.equalToSuperview()
        }

        containerView.snp.makeConstraints { make -> Void in
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }

        validationPendingView.snp.makeConstraints { make -> Void in
            make.edges.equalToSuperview()
        }

        validationPositiveView.snp.makeConstraints { make -> Void in
            make.edges.equalToSuperview()
        }

        validationNegativeView.snp.makeConstraints { make -> Void in
            make.edges.equalToSuperview()
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

    // MARK: - Gesture recognition

    private func setUpGestureRecognition() {
        tapGestureRecognizer.addTarget(self, action: #selector(didTapBackground))
        addGestureRecognizer(tapGestureRecognizer)
    }

    // MARK: - Background tap

    @objc
    private func didTapBackground() {
        endEditing(true)
    }

    @objc
    func didTapGenerateButton() {
        endEditing(true)
        self.creditCardControlView.creditCardNumberTextField.generate()
    }

    @objc
    func didTapValidateButton() {
        endEditing(true)

        guard let text = creditCardControlView.creditCardNumberTextField.text  else {
            fatalError("Couldn't get text")
        }

        delegate?.validationButtonClicked(string: text)
    }

    // MARK: - Privates

    private let backgroundView: UIView = BackgroundGradientWithLogo()
    private let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
