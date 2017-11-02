import SnapKit
import UIKit

public class MainView: UIView {

    let generateButton: UIButton = Factory.generateButton()
    let validateButton: UIButton = Factory.validateButton()
    let creditCardControlView: CreditCardControlView = Factory.creditCardCredentialView()

    public init() {
        super.init(frame: .zero)

        addSubviews()
        configureAutolayout()
    }

    private func addSubviews() {

    }

    private func configureAutolayout() {

    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
