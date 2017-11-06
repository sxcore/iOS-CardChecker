import IHKeyboardAvoiding
import PromiseKit
import UIKit

class MainViewController: UIViewController, CreditCardNumberDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureKeyboardAvoiding()
        resetToPendingAnimation()
    }

    // MARK: - Initializer

    init(cardDetailsService: CardDetailsServiceProtocol) {
        self.cardDetailsService = cardDetailsService

        super.init(nibName: nil, bundle: nil)

        mainView.delegate = self
    }

    override func loadView() {
        view = MainView()
    }

    func fetchCardDetails(number: Int) {
            resetToPendingAnimation()
        _ = cardDetailsService.fetchCardDetails(withNumber: number).then { cardDetails -> Void in

            if cardDetails.valid == "true" {
                self.validAnimation()
            }

            if cardDetails.valid == "false" {
                self.invalidAnimation()
            }
        }
    }

     var mainView: MainView { return forceCast(view) }

    // MARK: - ControllerProviding

    var controller: UIViewController { return self }

    // MARK: - Privates

    private let cardDetailsService: CardDetailsServiceProtocol

    private func configureKeyboardAvoiding() {
        KeyboardAvoiding.avoidingView = mainView.stackView
        KeyboardAvoiding.paddingForCurrentAvoidingView = 10.0
    }

    // MARK: - Delegates

    func validationButtonClicked(string: String) {
        guard let stringAsInt = Int(string) else {
            fatalError("String as integer failed")
        }

        fetchCardDetails(number: stringAsInt)
    }

    // MARK: - Required initializer

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
