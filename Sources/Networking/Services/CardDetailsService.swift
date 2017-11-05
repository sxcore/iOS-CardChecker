import Foundation
import PromiseKit

protocol CardDetailsServiceProtocol {
    func fetchCardDetails(withNumber number: Int) -> Promise<CardDetails>
}

class CardDetailsService: CardDetailsServiceProtocol {

    init(cardDetailsDeserializer: Deserializer<CardDetails>,
         APIKeyProvider: APIKeyProviding,
         URLProvider: URLProviding) {
        self.cardDetailsDeserializer = cardDetailsDeserializer
        self.APIKeyProvider = APIKeyProvider
        self.URLProvider = URLProvider
    }

    func fetchCardDetails(withNumber number: Int) -> Promise<CardDetails> {
        guard let URL = URL(string: "\(URLProvider)/\(APIKeyProvider)/\(number)") else {
            fatalError("Could not reformat string to URL!")
        }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let session = URLSession.shared

        return Promise { fullfill, reject in

            let dataTask = session.dataTask(with: URL) { data, response, error in
                if let data = data,
                let json = try? (self.cardDetailsDeserializer.deserialize(json: data)),
                    let result = CardDetails(bin: json.bin,
                                              bank: json.bank,
                                              card: json.card,
                                              type: json.type,
                                              level: json.level,
                                              country: json.country,
                                              countryCode: json.countryCode,
                                              webSite: json.webSite,
                                              phone: json.phone,
                                              valid: json.valid) as? CardDetails {
                        fullfill(result)

                } else if let error = error { reject(error)
                } else {
                    let error = NSError(domain: "PromiseKitTutorial", code: 0,
                                        userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                    reject(error)
                }
            }
            dataTask.resume()

        }
    }

    // MARK: - Privates

    private let cardDetailsDeserializer: Deserializer<CardDetails>
    private let APIKeyProvider: APIKeyProviding
    private let URLProvider: URLProviding
}
