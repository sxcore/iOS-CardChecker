import IHKeyboardAvoiding
import UIKit

class MainViewController: UIViewController {

    // MARK: - Initializer

    init(cardDetailsService: CardDetailsServiceProtocol) {
        self.cardDetailsService = cardDetailsService

        super.init(nibName: nil, bundle: nil)

        mainView.delegate = self
    }

    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureKeyboardAvoiding()
        resetToPendingAnimation()
    }

     let cardDetailsService: CardDetailsServiceProtocol

    // MARK: - ControllerProviding

    var controller: UIViewController { return self }

    // MARK: - Privates

    private func configureKeyboardAvoiding() {
        KeyboardAvoiding.avoidingView = mainView.stackView
        KeyboardAvoiding.paddingForCurrentAvoidingView = 10.0
    }

    // MARK: - View Configuration

    var mainView: MainView { return forceCast(view) }

    // MARK: - Required initializer

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
