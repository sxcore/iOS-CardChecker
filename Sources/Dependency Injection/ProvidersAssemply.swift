import Foundation
import Swinject
import SwinjectAutoregistration

class ProvidersAssembly: Assembly {
    func assemble(container: Container) {

        container.autoregister(URLProviding.self, initializer: URLProvider.init)

        container.register(APIKeyProviding.self) { _ in
            return APIKeyProvider(apiKeyDictionary: Bundle.main.infoDictionary)
        }
    }
}
