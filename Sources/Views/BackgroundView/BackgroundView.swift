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

      guard let color0 = UIColor(color: ColorHex.blue17EAD9),
            let color1 = UIColor(color: ColorHex.purple622774),
            let color2 = UIColor(color: ColorHex.blue7177EA),
            let color3 = UIColor(color: ColorHex.blue1BCEDF),
            let color4 = UIColor(color: ColorHex.blue3BB2B8),
            let color5 = UIColor(color: ColorHex.pinkF02FC2),
            let color6 = UIColor(color: ColorHex.purple5B247A) else {
            fatalError("Could not unwrap colors")
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
