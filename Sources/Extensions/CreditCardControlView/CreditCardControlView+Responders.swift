import UIKit

extension CreditCardControlView {
    func cardNumberChanged(sender: UITextField) {
        if sender.text?.count == 19 {
            dateNumberTextField.becomeFirstResponder()
        }
    }

    func dateTextFieldChanged(sender: UITextField) {

        guard let senderText = sender.text else {
            fatalError("Sender Text fatally unwrapped")
        }
        if senderText.isEmpty {
            creditCardNumberTextField.becomeFirstResponder()
        } else if sender.text?.count == 5 {
            aCVCNumberTextField.becomeFirstResponder()
        }
    }

    func ccvTextFieldChanged(sender: UITextField) {
        guard let senderText = sender.text else {
            fatalError("Sender Text fatally unwrapped")
        }
        if senderText.isEmpty {
            dateNumberTextField.becomeFirstResponder()
        }
    }
}
