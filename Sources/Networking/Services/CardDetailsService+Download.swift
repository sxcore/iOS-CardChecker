import Foundation

extension CardDetailsService {

    func download(from url: URL, block: @escaping (Data) -> Void, error errorBlock: @escaping (Error) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) -> Void in
            if let unwrappedError = error {
                errorBlock(unwrappedError)
            } else if let unwrappedData = data {
                block(unwrappedData)
            }
        }
        task.resume()
    }

}
