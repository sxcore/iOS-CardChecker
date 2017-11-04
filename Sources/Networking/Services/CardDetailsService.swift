import Foundation
import PromiseKit

protocol CardDetailsServiceProtocol {
    func fetchCardDetails(withNumber number:String) -> Promise<CardDetails>
}

class CardDetailsService: CardDetailsServiceProtocol {

    init(cardDetailsDeserializer: Deserializer<CardDetails>,
         URLProvider: URLProviding) {
        self.cardDetailsDeserializer = cardDetailsDeserializer
        self.URLProvider = URLProvider
    }

    func fetchCardDetails(withNumber number:String) -> Promise<CardDetails> {
        guard let URL = URL(string: "\(URLProvider)/apiNumber/\(number)") else {
            fatalError("Could not reformat string to URL!")
        }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let session = URLSession.shared

        session.dataTask(with: request) {data, response, error in
            guard let data = data, error == nil, response != nil else {
                print("Something went wrong")
                return
            }

            do {
                let establishments = try JSONDecoder().decode(self.cardDetailsDeserializer, from: data)
                print(establishments)
            } catch {
                print(error)
            }
            }.resume()
    }

    // MARK: - Privates

    private let cardDetailsDeserializer: Deserializer<CardDetails>
    private let URLProvider: URLProviding
}
