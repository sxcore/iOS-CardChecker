import Foundation

extension MainViewController {

    func fetchCardDetails(number: Int) {
        resetToPendingAnimation()
        setButtons(active: false)

        cardDetailsService.fetchCardDetails(creditCard: number, block: { cardDetails in

            DispatchQueue.main.async {
                if cardDetails.valid == "true" {
                    self.validAnimation()
                }

                if cardDetails.valid == "false" {
                    self.invalidAnimation()
                }
                self.setButtons(active: true)
            }
        }, error: { error in
            DispatchQueue.main.async {
                self.invalidAnimation()
                self.setButtons(active: true)
                self.mainView.validationNegativeView.messageLabel.text = error.localizedDescription
            }
        })

    }

    private func setButtons(active: Bool) {
            mainView.generateButton.isUserInteractionEnabled = active
            mainView.validateButton.isUserInteractionEnabled = active
        if !active {
            mainView.validateButton.alpha = 0.3
            mainView.generateButton.alpha = 0.3
        }
        if active {
            mainView.validateButton.alpha = 1.0
            mainView.generateButton.alpha = 1.0
        }
    }

}
