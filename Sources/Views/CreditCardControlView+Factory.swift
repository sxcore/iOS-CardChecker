import UIKit

extension CreditCardControlView {

    struct Factory {

        static func creditCardNumberTextField() -> UITextField {
            let creditCardNumberTextField = UITextField()
            creditCardNumberTextField.placeholder = "1234 1234 1234 1234"
            return creditCardNumberTextField
        }

        static func dateNumberTextField() -> UITextField {
            let dateNumberTextField = UITextField()
            dateNumberTextField.placeholder = "01/02"
            return dateNumberTextField
        }

        static func aCVCNumberTextField() -> UITextField {
            let aCVCNumberTextField = UITextField()
            aCVCNumberTextField.placeholder = "123"
            return aCVCNumberTextField
        }
    }

}
