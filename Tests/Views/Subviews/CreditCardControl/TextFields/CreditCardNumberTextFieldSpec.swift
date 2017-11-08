@testable import CCNumberValidator
import Nimble
import Quick

class CreditCardNumberTextFieldSpec: QuickSpec {

    override func spec() {
        describe("DateTextFieldSpec") {
            var sut: CreditCardNumberTextField!

            beforeEach {
                sut = CreditCardNumberTextField()
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

                it("for white space") {
                    sut.insertText(" ")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: sut.text!)
                    expect(result).to(beFalse())
                }

                it("for correctly generated number") {
                    sut.insertText("6660 1234 4321 5555")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 19, length: 0), replacementString: sut.text!)
                    expect(result).to(beFalse())
                }

            }

            describe("should change characters") {
                it("for empty string") {
                    sut.insertText("")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: sut.text!)
                    expect(result).to(beTrue())
                }

                it("for characters in range length") {
                    sut.insertText("654")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 0, length: 1), replacementString: sut.text!)
                    expect(result).to(beTrue())
                }
            }
        }
    }

}
