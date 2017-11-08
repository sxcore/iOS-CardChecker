@testable import CCNumberValidator
import Nimble
import Quick

class DateTextFieldSpec: QuickSpec {

    override func spec() {
        describe("DateTextFieldSpec") {
            var sut: DateTextField!

            beforeEach {
                sut = DateTextField()
            }
            afterEach {
                sut = nil
            }

            describe("should NOT change characters") {
                it("for NON digit character") {
                    sut.insertText("X")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: sut.text!)
                    expect(result).to(beFalse())
                }

            }

            describe("should change characters") {
                it("for correct date format") {
                    sut.insertText("1109")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: sut.text!)
                    expect(result).to(beTrue())
                }
            }
        }
    }

}
