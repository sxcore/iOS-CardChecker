import IHKeyboardAvoiding
import UIKit

class MainViewController: UIViewController, CreditCardNumberDelegate {

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

    func fetchCardDetails(number: Int) {
            resetToPendingAnimation()
        cardDetailsService.fetchCardDetails(creditCard: number, block: { cardDetails in

            DispatchQueue.main.async {
            if cardDetails.valid == "true" {
                self.validAnimation()
            }

            if cardDetails.valid == "false" {
                self.invalidAnimation()
           }}
        }, error: { error in
            DispatchQueue.main.async {
                self.invalidAnimation()
                self.mainView.validationNegativeView.messageLabel.text = error.localizedDescription
            }
        })

    }

    // MARK: - Delegates

    func validationButtonClicked(string: String) {
        if !string.isEmpty {
        guard let stringAsInt = Int(string) else {
            fatalError("Casting string as integer failed")
        }

            fetchCardDetails(number: stringAsInt)
        } else {
            presentAlertView()
        }
    }

    // MARK: - ControllerProviding

    var controller: UIViewController { return self }

    // MARK: - Privates

    private let cardDetailsService: CardDetailsServiceProtocol

    private func configureKeyboardAvoiding() {
        KeyboardAvoiding.avoidingView = mainView.stackView
        KeyboardAvoiding.paddingForCurrentAvoidingView = 10.0
    }

    private func presentAlertView() {
        let alert = UIAlertController(title: "No Input!",
                                      message: "Input Cannot be empty",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - View Configuration

    var mainView: MainView { return forceCast(view) }

    // MARK: - Required initializer

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
