@testable import CCNumberValidator
import Nimble
import Quick

class ErrorModelSpec: QuickSpec {

    override func spec() {
        describe ("ErrorModel") {
            var sut: ErrorModel!
            beforeEach {
                sut = ErrorModel(error: "1200", message: "always 200 even with error")
            }
            it("should have correct first field") {
                expect(sut.error).notTo(beNil())
                expect(sut.error) == "1200"
            }
            it("should have correct last field") {
                expect(sut.message).notTo(beNil())
                expect(sut.message) == "always 200 even with error"
            }
        }
    }

}
