import Foundation

class CardDetailsDeserializer: Deserializing {

    init(jsonDecoder: JSONDecoder) {
        self.jsonDecoder = jsonDecoder
    }

    // MARK: - Deserializing

    func deserialize(json: Any?) throws -> CardDetails {
        guard let json = json else {
            throw CardDetailsDeserializerError.emptyJson
        }
        let jsonData = try JSONSerialization.data(withJSONObject: json)

        return try jsonDecoder.decode(CardDetails.self, from: jsonData)
    }

    // MARK: - Private

    private let jsonDecoder: JSONDecoder

}

enum CardDetailsDeserializerError: Error {
    case emptyJson
}
