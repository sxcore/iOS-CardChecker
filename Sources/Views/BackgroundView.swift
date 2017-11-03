import HexColors
import Pastel
import SnapKit
import UIKit

class BackgroundGradientWithLogo: UIView {

    init() {
        super.init(frame: .zero)
        configureBackgroundGradient()
        configureSubviews()
        configureAutolayout()
    }

    private func configureBackgroundGradient() {
        gradientView.startPastelPoint = .topLeft
        gradientView.endPastelPoint = .bottomRight
        gradientView.animationDuration = 3.5

        gradientView.setColors(gradientColors)
        gradientView.startAnimation()
    }

    private var gradientColors: [UIColor] {
        guard let color0 = UIColor("#17EAD9", alpha: 1.0),
            let color1 = UIColor("#622774", alpha: 1.0),
            let color2 = UIColor("#7177EA", alpha: 1.0),
            let color3 = UIColor("#1BCEDF", alpha: 1.0),
            let color4 = UIColor("#3BB2B8", alpha: 1.0),
            let color5 = UIColor("#F02FC2", alpha: 1.0),
            let color6 = UIColor("#5B247A", alpha: 1.0) else {

            fatalError("Could not create Colors")

        }

        return [color0, color1, color2, color3, color4, color5, color6]
    }

    private func configureSubviews() {
        addSubview(gradientView)
    }

    private func configureAutolayout() {
        gradientView.snp.makeConstraints { make -> Void in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Privates

    private let gradientView: PastelView = PastelView(frame: .zero)

    // MARK: - Required initializer

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
