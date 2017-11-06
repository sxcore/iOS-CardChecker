import IHKeyboardAvoiding
import PromiseKit
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureKeyboardAvoiding()
    }

    // MARK: - Initializer

    init(cardDetailsService: CardDetailsServiceProtocol) {
        self.cardDetailsService = cardDetailsService

        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = MainView()
    }

    override func touchesBegan(_: Set<UITouch>, with: UIEvent?) {

        mainView.creditCardControlView.creditCardNumberTextField.resignFirstResponder()
        mainView.creditCardControlView.aCVCNumberTextField.resignFirstResponder()
        mainView.creditCardControlView.dateNumberTextField.resignFirstResponder()
    }

    func fetchCardDetails(number: Int) {
        _ = cardDetailsService.fetchCardDetails(withNumber: number).then { cardDetails in
            print (cardDetails)
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

    // MARK: - Required initializer

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
