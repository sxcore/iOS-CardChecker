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

    internal let backgroundView: UIView = BackgroundGradientWithLogo()
    private let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
