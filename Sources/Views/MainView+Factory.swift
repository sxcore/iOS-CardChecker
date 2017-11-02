import UIKit

extension MainView {

    struct Factory {

        static func generateButton() -> UIButton {
            let generateButton = UIButton()
            return generateButton
        }

        static func validateButton() -> UIButton {
            let validateButton = UIButton()
            return validateButton
        }

        static func creditCardCredentialView() -> CreditCardControlView {
            let creditCardCredentialView = CreditCardControlView()
            return creditCardCredentialView
        }

    }

}
