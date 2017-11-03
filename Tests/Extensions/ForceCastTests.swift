import CCNumberValidator
import Nimble
import Quick

internal class ForceCastSpec: QuickSpec {

    override func spec() {
        describe("ForceCast") {
            it("should throw an assertion if casting fails") {
                expect { () -> Void in
                    let _: Int = forceCast("Whatever")
                    }.to(throwAssertion())
            }

            it("should do the cast if possible") {
                let mainView: UIView = MainView()

                let result: MainView = forceCast(mainView)

                expect(result) == mainView
            }
        }
    }

}
