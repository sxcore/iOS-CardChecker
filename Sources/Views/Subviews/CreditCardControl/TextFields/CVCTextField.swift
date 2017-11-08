import UIKit

class CVCTextField: UITextField, UITextFieldDelegate {

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

        let digits = NSCharacterSet.decimalDigits
        for i in string.unicodeScalars {
            if !(digits as NSCharacterSet).longCharacterIsMember(i.value) {
                return false
            }
        }

        if range.location > 2 {
            return false }
        return true
    }

    // MARK: - Required Init

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
