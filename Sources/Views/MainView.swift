import SnapKit
import UIKit

public class MainView: UIView {

    let generateButton: UIButton = Factory.generateButton()
    let validateButton: UIButton = Factory.validateButton()

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

extension MainView {

    struct Factory {

        static func generateButton() -> UIButton {
            let generateButton = UIButton()
            return generateButton
        }

        static func validateButton() -> UIButton {
            let validateButton = UIButton()
            return validateButton
        }

    }

}
