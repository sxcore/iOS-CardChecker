import UIKit

extension ValidationIndicatorView {

    struct Factory {

        static func messageLabel() -> UILabel {
            let messageLabel = UILabel()
            messageLabel.textAlignment = .left
            messageLabel.textColor = UIColor.white
            messageLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
            messageLabel.lineBreakMode = .byWordWrapping
            messageLabel.numberOfLines = 0
            return messageLabel
        }

        static func statusImageView() -> UIImageView {
            let statusImageView = UIImageView()
            statusImageView.contentMode = .center
            return statusImageView
        }

        static func textAndIconView() -> UIView {
            let textAndIconView = UIView()
            return textAndIconView
        }

    }

}
