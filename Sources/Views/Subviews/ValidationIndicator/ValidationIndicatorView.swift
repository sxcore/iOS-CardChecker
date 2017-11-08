import SnapKit
import UIKit

enum ValidationIndicatorViewType {
    case negative, neutral, positive
}

class ValidationIndicatorView: UIView {

    init(type: ValidationIndicatorViewType) {
        self.type = type
        super.init(frame: .zero)

        addSubviews()
        setupViews()
        configureAutoLayout()
    }

    // MARK: - Privates

    private let type: ValidationIndicatorViewType
    private let textAndIconView: UIView = Factory.textAndIconView()
    internal let messageLabel: UILabel = Factory.messageLabel()
    private let statusImageView: UIImageView = Factory.statusImageView()

    private func addSubviews() {
        textAndIconView.addSubview(messageLabel)
        textAndIconView.addSubview(statusImageView)
        addSubview(textAndIconView)
    }

    private func setupViews() {
        messageLabel.text = type.messageText
        statusImageView.image = type.iconImage
        backgroundColor = type.backgroundColor
    }

    private func configureAutoLayout() {
        textAndIconView.snp.makeConstraints { make -> Void in
            make.center.equalToSuperview()
        }

        messageLabel.snp.makeConstraints { make -> Void in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(statusImageView.snp.left).offset(-10)
        }

        statusImageView.snp.makeConstraints { make -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }

    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
