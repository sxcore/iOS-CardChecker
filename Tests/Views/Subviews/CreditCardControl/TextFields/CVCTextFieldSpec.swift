@testable import CCNumberValidator
import Nimble
import Quick

class CVCTextFieldSpec: QuickSpec {

    override func spec() {
        describe("CVCTextFieldSpec") {
            var sut: CVCTextField!

            beforeEach {
                sut = CVCTextField()
            }
            afterEach {
                sut = nil
            }

            describe("should NOT change characters") {
                it("in range of 0") {
                    let singleChar = "X"
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: singleChar)
                    expect(result).to(beFalse())
                }

                it("in range of 3") {
                    sut.insertText("666")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 3, length: 0), replacementString: sut.text!)
                    expect(result).to(beFalse())
                }
            }

            describe("should change characters") {
                it("in range of 2") {
                    sut.insertText("51")
                    let result = sut.textField(sut, shouldChangeCharactersIn: NSRange(location: 2, length: 0), replacementString: sut.text!)
                    expect(result).to(beTrue())
                }
            }
        }
    }

}
