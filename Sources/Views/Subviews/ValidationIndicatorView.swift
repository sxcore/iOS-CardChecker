import SnapKit
import UIKit

enum ValidationIndicatorViewType {
    case negative, neutral, positive
}

class ValidationIndicatorView: UIView {

}

extension ValidationIndicatorViewType {

    var messageText: String {
        switch self {
        case .negative:
            return "Card number is invalid!"
        case .neutral:
            return "Waiting for validation..."
        case .positive:
            return "Card number is valid."
        }

    }

    var iconImage: UIImage {
        switch self {
        case .negative:
            return #imageLiteral(resourceName: "result_invalid")
        case .neutral:
            return #imageLiteral(resourceName: "waiting_for_result")
        case .positive:
            return #imageLiteral(resourceName: "result_valid")
        }

    }

    var backgroundColor: UIColor {
        switch self {
        case .negative:
            return UIColor.red
        case .neutral:
            return UIColor.green
        case .positive:
            return UIColor.orange
        }
    }

}
