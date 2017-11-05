import Foundation

protocol APIKeyProviding {
    var apiKey: String { get }
}

class APIKeyProvider: APIKeyProviding {

    private let apiKeyDictionary: [String: Any]?

    init(apiKeyDictionary: [String: Any]?) {

        let resource = "APIKey"
        let fileExtension = "plist"

        guard let apiKeyPlistPath = Bundle.main.path(forResource: resource,
                                                     ofType: fileExtension) else {
                                                     fatalError("Either apiKeyPlistPath is wrong or file doesn't exist")
        }

        guard let apiKeysFromPlist = NSDictionary(contentsOfFile: apiKeyPlistPath) as? [String: AnyObject] else {
            fatalError("URL: Couldn't unwrap custom Plist properly - maybe it's Array and not Dictionary?")
        }

        self.apiKeyDictionary = apiKeysFromPlist
    }

    // MARK: - PusherConfigurationProviding

    var apiKey: String {
        guard let binCodeDict = apiKeyDictionary?["BinCode"] as? [String: Any] else {
            fatalError("Couldn't unwrap infoDictionary")
        }

        guard let apiKey = binCodeDict["API_KEY"] as? String else {
            fatalError("Couldn't get appKey from Dictionary")
        }

        if apiKey.isEmpty {
            fatalError("Please fill API_KEY in APIKey.plist")
        }

        return apiKey
    }

}
