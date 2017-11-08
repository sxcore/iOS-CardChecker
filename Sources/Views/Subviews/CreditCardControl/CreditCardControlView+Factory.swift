import UIKit

extension CreditCardControlView {

    struct Factory {

        static func creditCardNumberTextField() -> UITextField {
            let creditCardNumberTextField = UITextField()
            creditCardNumberTextField.placeholder = "1234 1234 1234 1234"
            creditCardNumberTextField.keyboardType = .numberPad
            return creditCardNumberTextField
        }

        static func dateNumberTextField() -> UITextField {
            let dateNumberTextField = UITextField()
            dateNumberTextField.placeholder = "01/02"
            dateNumberTextField.keyboardType = .numberPad
            return dateNumberTextField
        }

        static func aCVCNumberTextField() -> CVCTextField {
            let aCVCNumberTextField = CVCTextField()
            aCVCNumberTextField.placeholder = "123"
            aCVCNumberTextField.keyboardType = .numberPad
            aCVCNumberTextField.returnKeyType = .done
            aCVCNumberTextField.autocorrectionType = .no
            aCVCNumberTextField.autocapitalizationType = .none
            return aCVCNumberTextField
        }
    }

}
