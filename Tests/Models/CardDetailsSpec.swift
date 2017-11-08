@testable import CCNumberValidator
import Nimble
import Quick

class CardDetailsSpec: QuickSpec {

    override func spec() {
        describe ("CardDetailsModel") {
            var sut: CardDetails!
            beforeEach {
                sut = CardDetails(bin: "123",
                                  bank: "embank",
                                  card: "none",
                                  type: "prestige",
                                  level: "zero",
                                  country: "United Kingdom",
                                  countryCode: "UK",
                                  webSite: "www.uk.pl",
                                  phone: "666-666-666",
                                  valid: "true")
            }
            it("should have correct first field") {
                expect(sut.bin) == "123"
            }
            it("should have correct last field") {
                expect(sut.valid) == "true"
            }
        }
    }

}
