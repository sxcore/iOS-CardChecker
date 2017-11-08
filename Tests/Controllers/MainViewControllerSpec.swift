@testable import CCNumberValidator
import Nimble
import Nimble_Snapshots
import Quick

class MainViewControllerSpec: QuickSpec {

    override func spec() {
        describe("MainViewController") {
            var sut: MainViewControllerMock!
            var cardDetailsServiceStub: CardDetailsServiceStub!

        beforeEach {
            cardDetailsServiceStub = CardDetailsServiceStub()
            sut = MainViewControllerMock(cardDetailsService: cardDetailsServiceStub)
        }

        afterEach {
            sut = nil
            cardDetailsServiceStub = nil
        }
            describe("after view was loaded") {
                beforeEach {
                    sut.loadView()
                }
            }

                it("shouldHaveValidSnapshot") {
                    sut.view.frame = UIScreen.main.bounds

                    expect(sut.view).to(haveValidDeviceAgnosticSnapshot())
                }

                it("it should have empty text fields") {
                    expect(sut.mainView.creditCardControlView.creditCardNumberTextField.text) == ""
                    expect(sut.mainView.creditCardControlView.dateNumberTextField.text) == ""
                    expect(sut.mainView.creditCardControlView.aCVCNumberTextField.text) == ""
                }

            describe("generate validate tap") {
                beforeEach {
                    sut.mainView.onValidateButtonTapped = {
                        sut.validateButtonDidCall = false
                    }
                    it("should invoke validateButton clousure") {
                        expect(sut.validateButtonDidCall).to(beTrue())
                    }
                }
            }

            describe("hide views for pending") {
                it("should make valid validation positive view hidden") {
                    expect(sut.mainView.validationPositiveView.isHidden).to(beTrue())
                }

                it("should make invalid validation negative view hidden") {
                    expect(sut.mainView.validationNegativeView.isHidden).to(beTrue())
                }

                it("should make invalid pending view NOT hidden") {
                    expect(sut.mainView.validationPendingView.isHidden).to(beFalse())
                }

            }

        }

    }

}
