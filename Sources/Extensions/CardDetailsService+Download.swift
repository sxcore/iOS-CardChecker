import Foundation
import UIKit

extension CardDetailsService {

    func fetchData(from url: URL, block: @escaping (Data) -> Void, error errorBlock: @escaping (Error) -> Void) {
        activityIndicator(isVisible: true)
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) -> Void in
            if let unwrappedError = error {
                errorBlock(unwrappedError)
            } else if let unwrappedData = data {
                block(unwrappedData)
            }
        }
        task.resume()
        activityIndicator(isVisible: false)
    }

    private func activityIndicator(isVisible: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isVisible
    }

}
