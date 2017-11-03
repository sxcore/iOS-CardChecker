import Foundation

public struct CardDetails: Decodable {
    let bin: String
    let bank: String
    let card: String
    let level: String
    let country: String
    let countryCode: String
    let webSite: String
    let phone: String
    let valid: String
}

extension CardDetails {

    private enum CodingKeys: String, CodingKey {
        case bin
        case bank
        case card
        case level
        case country
        case countryCode = "countrycode"
        case webSite = "website"
        case phone
        case valid
    }

}
