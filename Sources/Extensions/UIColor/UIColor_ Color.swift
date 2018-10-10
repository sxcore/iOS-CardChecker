import UIKit

enum ColorHex: String {
    case black5F5A6A = "5F5A6A"
    case blue17EAD9 = "17EAD9"
    case blue1BCEDF = "1BCEDF"
    case blue3BB2B8 = "3BB2B8"
    case blue7177EA = "7177EA"
    case grayB3B3B8 = "B3B3B8"
    case grayE4E4E4 = "E4E4E4"
    case grayF8F8FA = "F8F8FA"
    case green4CC359 = "4CC359"
    case green5DC869 = "5DC869"
    case green92ECB4 = "92ECB4"
    case orangeFDB06 = "FD8B06"
    case pinkF02FC2 = "F02FC2"
    case purple5B247A = "5B247A"
    case purple622774 = "622774"
    case purpleAB9BFF = "AB9BFF"
    case purpleBCAEF8 = "BCAEF8"
    case purpleEAEAF5 = "EAEAF5"
    case redBA6767 = "BA6767"
    case redEF5350 = "EF5350"
    case redF90707 = "F90707"
}

extension UIColor {
    convenience init!(color: ColorHex) {
        self.init(hexString: color.rawValue)
    }
}
