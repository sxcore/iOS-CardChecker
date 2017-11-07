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

        static func aCVCNumberTextField() -> UITextField {
            let aCVCNumberTextField = UITextField()
            aCVCNumberTextField.placeholder = "123"
            aCVCNumberTextField.keyboardType = .numberPad
            return aCVCNumberTextField
        }
    }

}
