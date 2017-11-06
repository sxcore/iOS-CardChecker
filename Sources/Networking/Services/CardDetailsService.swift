import Foundation
import PromiseKit

protocol CardDetailsServiceProtocol {
    func fetchCardDetails(withNumber number: Int) -> Promise<CardDetails>
}

class CardDetailsService: CardDetailsServiceProtocol {

    init(APIKeyProvider: APIKeyProviding,
         URLProvider: URLProviding) {
        self.APIKeyProvider = APIKeyProvider
        self.URLProvider = URLProvider
    }

    func fetchCardDetails(withNumber number: Int) -> Promise<CardDetails> {
        guard let URL = URL(string: "\(URLProvider.url)/\(APIKeyProvider.apiKey)/\(number)/") else {
            fatalError("Could not reformat string to URL!")
        }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        let decoder = JSONDecoder()
        let session = URLSession.shared

        return Promise { fullfill, reject in

            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data,
                   let json = (try? decoder.decode(CardDetails.self, from: data)) {
                    fullfill(json)
                } else if let error = error {
                    reject(error)
                }

            }
            dataTask.resume()
        }
    }

    // MARK: - Privates

    private let APIKeyProvider: APIKeyProviding
    private let URLProvider: URLProviding
}
