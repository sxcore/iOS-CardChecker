import UIKit

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
            return UIColor(color: ColorHex.redF90707)
        case .neutral:
            return UIColor(color: ColorHex.orangeFDB06)
        case .positive:
            return UIColor(color: ColorHex.green5DC869)
        }
    }

}
