import UIKit

extension CreditCardControlView {

    struct Factory {

        static func creditCardNumberTextField() -> CreditCardNumberTextField {
            let creditCardNumberTextField = CreditCardNumberTextField()
            creditCardNumberTextField.placeholder = "1234 1234 1234 1234"
            creditCardNumberTextField.keyboardType = .numberPad
            creditCardNumberTextField.returnKeyType = .done
            creditCardNumberTextField.autocorrectionType = .no
            creditCardNumberTextField.autocapitalizationType = .none
            creditCardNumberTextField.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
            return creditCardNumberTextField
        }

        static func dateNumberTextField() -> DateTextField {
            let dateNumberTextField = DateTextField()
            dateNumberTextField.placeholder = "01/02"
            dateNumberTextField.keyboardType = .numberPad
            dateNumberTextField.returnKeyType = .done
            dateNumberTextField.autocorrectionType = .no
            dateNumberTextField.autocapitalizationType = .none
            dateNumberTextField.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
            return dateNumberTextField
        }

        static func aCVCNumberTextField() -> CVCTextField {
            let aCVCNumberTextField = CVCTextField()
            aCVCNumberTextField.placeholder = "123"
            aCVCNumberTextField.keyboardType = .numberPad
            aCVCNumberTextField.returnKeyType = .done
            aCVCNumberTextField.autocorrectionType = .no
            aCVCNumberTextField.autocapitalizationType = .none
            aCVCNumberTextField.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
            return aCVCNumberTextField
        }
    }

}
