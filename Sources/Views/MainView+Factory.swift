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
            return validationIndicatorView
        }

        static func creditCardControlView() -> CreditCardControlView {
            let creditCardControlView = CreditCardControlView()
            return creditCardControlView
        }

        static func generateButton() -> UIButton {
            let generateButton = UIButton()
            return generateButton
        }

        static func validateButton() -> UIButton {
            let validateButton = UIButton()
            return validateButton
        }

    }

}
