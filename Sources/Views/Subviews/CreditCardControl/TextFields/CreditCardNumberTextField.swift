import UIKit

class CreditCardNumberTextField: UITextField, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        delegate = self
    }

    // MARK: - UITextFieldDelegate

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if string == "" {
            return true }

        if range.length > 0 {
            return true }

        if string == " " {
            return false }

        if range.location >= 19 {
            return false }

        guard var number = textField.text else {
            fatalError("Encountered a nil in TextField")
        }

        let numberCount = number.count

        let numberWithSpaces = string.replacingOccurrences(of: " ", with: "")
        let digits = NSCharacterSet.decimalDigits
        for i in numberWithSpaces.unicodeScalars {
            if !(digits as NSCharacterSet).longCharacterIsMember(i.value) {
                return false
            }
        }

        if numberCount > 0 {
            if numberCount < 5 && numberCount % 4 == 0 {
                number.append(" ")
            } else if ((numberCount) + 1) % 5 == 0 {
                number.append(" ")
            }
        }

        textField.text = number
        return true
    }

    // MARK: - Required Init

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
