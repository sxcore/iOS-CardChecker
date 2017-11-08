import UIKit

class CVCTextField: UITextField, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    // MARK:- Required Init

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
