@testable import CCNumberValidator

class CardDetailsServiceStub: CardDetailsServiceProtocol {

    func fetchCardDetails(creditCard: Int, block: @escaping (CardDetails) -> Void, error errorBlock: @escaping (Error) -> Void) {

    }

}
