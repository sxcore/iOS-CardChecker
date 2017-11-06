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

        addSubviews()
        configureAutolayout()
        setUpGestureRecognition()
    }

    private func addSubviews() {
        addSubview(backgroundView)
        stackView.addArrangedSubview(validationIndicatorView)
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

        validationIndicatorView.snp.makeConstraints { make -> Void in
            make.height.equalTo(50)
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

    // MARK: - Privates

    private let backgroundView: UIView = BackgroundGradientWithLogo()
    private let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
