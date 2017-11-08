import Foundation
import UIKit

protocol CardDetailsServiceProtocol {
    func fetchCardDetails(creditCard: Int,
                          block: @escaping (CardDetails) -> Void,
                          error errorBlock: @escaping (Error) -> Void)
}

public class CardDetailsService: CardDetailsServiceProtocol {

    init(APIKeyProvider: APIKeyProviding,
         URLProvider: URLProviding) {
        self.APIKeyProvider = APIKeyProvider
        self.URLProvider = URLProvider
    }

    func fetchCardDetails(creditCard: Int,
                          block: @escaping (CardDetails) -> Void,
                          error errorBlock: @escaping (Error) -> Void) {

        guard let URL = URL(string: "\(URLProvider.url)/\(APIKeyProvider.apiKey)/\(creditCard)/") else {
            fatalError("Could not reformat string to URL!")
        }

        let decoder = JSONDecoder()

        fetchData(from: URL, block: { data in
                if let creditCardDetails = try? decoder.decode(CardDetails.self, from: data) {
                    block(creditCardDetails)
                } else if let errorModel = try? decoder.decode(ErrorModel.self, from: data) {
                    let userInfo: [String: Any] = [NSLocalizedDescriptionKey: errorModel.message]
                    let error = NSError(domain: "", code: Int(errorModel.error) ?? -1, userInfo: userInfo)
                    errorBlock(error)
                }
        }, error: { error in
            errorBlock(error)
        })
    }

    // MARK: - Privates

    private let APIKeyProvider: APIKeyProviding
    private let URLProvider: URLProviding
}
