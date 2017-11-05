import PromiseKit
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCardDetails(number: 123123123123123)
    }
    // MARK: - Initializer

    init(cardDetailsService: CardDetailsServiceProtocol) {
        self.cardDetailsService = cardDetailsService

        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = MainView()
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

    // MARK: - Required initializer

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
