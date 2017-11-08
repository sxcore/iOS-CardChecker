import UIKit

class DateTextField: UITextField, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        delegate = self
    }

    // MARK: - UITextFieldDelegate

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if range.length > 0 {
            return true }

        let digitsSet = NSCharacterSet.decimalDigits
        for i in string.unicodeScalars {
            if !(digitsSet as NSCharacterSet).longCharacterIsMember(i.value) {
                return false
            }
        }

        guard let date = textField.text else {
            fatalError("TextField Text was nil")
        }
        if date.count == 1 {
            textField.text = String(format: "%@%@/", date, string)
            return false
        }
        if date.count >= 5 {
            return false
        }
        return true
    }

    // MARK: - Required Init

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
