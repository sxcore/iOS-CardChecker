import Foundation

extension MainViewController {

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

}
