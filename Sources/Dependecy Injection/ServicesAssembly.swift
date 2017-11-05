import Swinject
import SwinjectAutoregistration

class ServicesAssembly: Assembly {

    func assemble(container: Container) {

        container.register(CardDetailsServiceProtocol.self) { resolver in
                return CardDetailsService(APIKeyProvider: resolver ~> APIKeyProviding.self,
                                          URLProvider: resolver ~> URLProviding.self)
        }
    }

}
