import CCNumberValidator
import Nimble
import Quick

class String_InsertSeparatorSpec: QuickSpec {

    override func spec() {
        describe("InsertSeparator extension") {
            it("should insert separators into string") {
                let test_string = "1234ABCD2345QWER"
                let separaratedString = String.insertSeparator(test_string)
                expect(separaratedString) == "1234 ABCD 2345 QWER"
            }
        }
    }

}
