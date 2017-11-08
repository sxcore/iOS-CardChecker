import HexColors
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
            guard let redColor = UIColor("#f90707", alpha: 1.0) else {
                fatalError("Could not Fetch Red Color")
            }
            return redColor

        case .neutral:
            guard let orangeColor = UIColor("#FD8B06", alpha: 1.0) else {
                fatalError("Could not Fetch Orange Color")
            }
            return orangeColor

        case .positive:
            guard let greenColor = UIColor("#5DC869", alpha: 1.0) else {
                fatalError("Could not Fetch Green Color")
            }
            return greenColor
        }
    }

}
