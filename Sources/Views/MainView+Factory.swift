import UIKit

extension MainView {

    struct Factory {

        static func stackView() -> UIStackView {
            let stackView = UIStackView()
            stackView.alignment = .center
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.spacing = 3.0
            return stackView
        }

        static func validationIndicatorView() -> ValidationIndicatorView {
            let validationIndicatorView = ValidationIndicatorView()
            validationIndicatorView.backgroundColor = UIColor.green
            return validationIndicatorView
        }

        static func creditCardControlView() -> CreditCardControlView {
            let creditCardControlView = CreditCardControlView()
            return creditCardControlView
        }

        static func generateButton() -> UIButton {
            let generateButton = UIButton()
            generateButton.titleLabel?.text = "Generate Random Credit Card Code"
            generateButton.backgroundColor = UIColor.yellow
            return generateButton
        }

        static func validateButton() -> UIButton {
            let validateButton = UIButton()
            validateButton.titleLabel?.text = "Validete Given Credit Card Code"
            validateButton.backgroundColor = UIColor.red
            return validateButton
        }

    }

}
