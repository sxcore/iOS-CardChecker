import Foundation

public struct ErrorModel: Decodable {
    let error: String
    let message: String
}

extension ErrorModel {

    private enum CodingKeys: String, CodingKey {
        case error
        case message
    }

}
