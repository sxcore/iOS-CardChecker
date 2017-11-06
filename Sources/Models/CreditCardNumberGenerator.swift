import Foundation
import UIKit

enum CreditCardType : UInt32 {
    case visa
    case masterCard
    case discover
    case americanExpress
}

extension UITextField {

func generateCreditCardNumber(for type: CreditCardType) -> String {

   let cardLenght = (type == .americanExpress) ? 15 : 16

    var cardNumber = [Int](repeating: 0, count: cardLenght)
    var startingIndex = 0

    if type == .masterCard {
        cardNumber[0] = 5
        cardNumber[1] = Int(arc4random_uniform(5) + 1)
        startingIndex = 2
    } else if type == .discover {
        cardNumber.replaceSubrange(Range(0...3), with: [6, 0, 1, 1])
        startingIndex = 4
    } else if type == .americanExpress {
        cardNumber.replaceSubrange(Range(0...1), with: [3, 4])
        startingIndex = 2
    }

    for i in startingIndex ..< cardNumber.count {
        cardNumber[i] = Int(arc4random_uniform(10))
    }

    let offset = (cardNumber.count + 1) % 2
    var sum = 0
    for i in 0 ..< cardNumber.count - 1 {
        if ((i + offset) % 2) == 1 {
            var temp = cardNumber[i] * 2
            if temp > 9 {
                temp -= 9
            }
            sum += temp
        } else {
            sum += cardNumber[i]
      }
    }
    let finalDigit = (10 - (sum % 10)) % 10
    cardNumber[cardNumber.count - 1] = finalDigit

    return cardNumber.map({ String($0) }).joined(separator: "")

    }

}


