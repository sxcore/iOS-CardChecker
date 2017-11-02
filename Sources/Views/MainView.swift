import SnapKit
import UIKit

public class MainView: UIView {

    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.blue
    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
