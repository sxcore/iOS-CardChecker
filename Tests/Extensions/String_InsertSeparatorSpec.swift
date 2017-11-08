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

            it("should insert separators after 4 chars in string") {
                let test_string = "ABCD5"
                let separatedString = String.insertSeparator(test_string)
                expect(separatedString) == "ABCD 5"
            }

            it("should do nothing with empty string") {
               let test_string = ""
               let testedString = String.insertSeparator(test_string)
               expect(testedString) == test_string
            }

            it("should do nothing with string with one char") {
                let test_string = "X"
                let testedString = String.insertSeparator(test_string)
                expect(testedString) == test_string
            }
        }
    }

}
