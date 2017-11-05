import Swinject
import SwinjectAutoregistration

class ServicesAssembly: Assembly {

    func assemble(container: Container) {

        container.register(Deserializer<CardDetails>.self, name: "CardDetails") { _ in
                return Deserializer(CardDetailsDeserializer(jsonDecoder: JSONDecoder()))
        }

        container.register(CardDetailsServiceProtocol.self) { resolver in
                return CardDetailsService(cardDetailsDeserializer: resolver ~> (Deserializer<CardDetails>.self,
                                                                                  name: "CardDetails"),
                                            APIKeyProvider: resolver ~> APIKeyProviding.self,
                                            URLProvider: resolver ~> URLProviding.self)
        }
    }

}
