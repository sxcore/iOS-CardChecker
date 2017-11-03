@testable import CCNumberValidator
import Nimble
import Quick

class CommentsDeserializerSpec: QuickSpec {

    // swiftlint:disable function_body_length
    override func spec() {
        describe("Card Details deserializer") {
            var deserializer: CardDetailsDeserializer!

            beforeEach {
                deserializer = CardDetailsDeserializer(jsonDecoder: JSONDecoder())
            }

            afterEach {
                deserializer = nil
            }

            describe("deserializing with success") {
                var deserialized: CardDetails!

                beforeEach {
                    let response: Any? = [
                                "bin": "515735",
                                "bank": "CITIBANK N.A.",
                                "card": "MASTERCARD",
                                "type": "CREDIT",
                                "level": "WORLD",
                                "country": "UNITED STATES",
                                "countrycode": "US",
                                "website": "www.randomsite.com",
                                "phone": "666-666-666",
                                "valid": "true"
                            ]

                    deserialized = try! deserializer.deserialize(json: response)
                }

                afterEach {
                    deserialized = nil
                }

                    it("should have correct bin") {
                        expect(deserialized.bin) == "515735"
                    }

                    it("should have correct bank") {
                        expect(deserialized.bank) == "CITIBANK N.A."
                    }

                    it("should have correct card") {
                        expect(deserialized.card) == "MASTERCARD"
                    }

                    it("should have correct type") {
                        expect(deserialized.type) == "CREDIT"
                    }

                    it("should have correct level") {
                        expect(deserialized.level) == "WORLD"
                    }

                    it("should have correct country") {
                        expect(deserialized.country) == "UNITED STATES"
                    }

                    it("should have correct countrycode") {
                        expect(deserialized.countryCode) == "US"
                    }

                    it("should have correct website") {
                        expect(deserialized.webSite) == "www.randomsite.com"
                    }

                    it("should have correct phone") {
                        expect(deserialized.phone) == "666-666-666"
                    }

                    it("should have correct valid") {
                        expect(deserialized.valid) == "true"
                    }

            describe("deserializing with failure") {
                it("throw emptyJson error") {
                    expect { _ = try deserializer.deserialize(json: nil) }
                        .to(throwError(CardDetailsDeserializerError.emptyJson))
                    }
                }
            }
        }
    }

}
