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

        }

    }

}
