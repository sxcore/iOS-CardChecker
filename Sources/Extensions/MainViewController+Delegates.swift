import  UIKit

extension MainViewController: CreditCardNumberDelegate {

    internal func validationButtonClicked(string: String) {
        if !string.isEmpty {
            guard let stringAsInt = Int(string) else {
                fatalError("Casting string as integer failed")
            }

            fetchCardDetails(number: stringAsInt)
        } else {
            presentAlertView()
        }
    }

    private func presentAlertView() {
        let alert = UIAlertController(title: "No Input!",
                                      message: "Input Cannot be empty",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
