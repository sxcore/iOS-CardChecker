extension MainViewController {

   internal func invalidAnimation() {
        mainView.validationPendingView.isHidden = true
        mainView.validationPositiveView.isHidden = true
        mainView.validationNegativeView.isHidden = false
    }

    internal func validAnimation() {
        mainView.validationPendingView.isHidden = true
        mainView.validationPositiveView.isHidden = false
        mainView.validationNegativeView.isHidden = true
    }

    internal func resetToPendingAnimation() {
        mainView.validationPendingView.isHidden = false
        mainView.validationPositiveView.isHidden = true
        mainView.validationNegativeView.isHidden = true
    }

}
