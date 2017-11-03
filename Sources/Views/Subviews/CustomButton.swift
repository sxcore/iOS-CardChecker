import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
    }

    private func setupView() {

        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.9533678756, green: 0.9533678756, blue: 0.9533678756, alpha: 1)
        layer.masksToBounds = true
        setBackgroundImage(.from(color: UIColor.lightGray), for: .highlighted)
    }

    // MARK: - Required initializer

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
