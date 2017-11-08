import UIKit

extension MainView {

    struct Factory {

        static func stackView() -> UIStackView {
            let stackView = UIStackView()
            stackView.alignment = .center
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.spacing = 20.0
            return stackView
        }

        static func containerView() -> UIView {
            let containerView = UIView()
            return containerView
        }

        static func validationPendingView() -> ValidationIndicatorView {
            let validationIndicatorView = ValidationIndicatorView(type: .neutral)
            validationIndicatorView.layer.cornerRadius = 10
            return validationIndicatorView
        }

        static func validationPositiveView() -> ValidationIndicatorView {
            let validationIndicatorView = ValidationIndicatorView(type: .positive)
            validationIndicatorView.layer.cornerRadius = 10
            return validationIndicatorView
        }

        static func validationNegativeView() -> ValidationIndicatorView {
            let validationIndicatorView = ValidationIndicatorView(type: .negative)
            validationIndicatorView.layer.cornerRadius = 10
            return validationIndicatorView
        }

        static func creditCardControlView() -> CreditCardControlView {
            let creditCardControlView = CreditCardControlView()
            return creditCardControlView
        }

        static func generateButton() -> CustomButton {
            let generateButton = CustomButton()
            generateButton.setTitle("Generate Random Credit Card Code", for: .normal)
            generateButton.addTarget(self, action: #selector(didTapGenerateButton), for: .touchUpInside)
            generateButton.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            return generateButton
        }

        static func validateButton() -> CustomButton {
            let validateButton = CustomButton()
            validateButton.setTitle("Validate Given Credit Card Code", for: .normal)
            validateButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            validateButton.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
            return validateButton
        }

    }

}
