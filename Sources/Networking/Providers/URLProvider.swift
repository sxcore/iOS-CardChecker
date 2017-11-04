protocol URLProviding {
    var url: String { get }
}

class URLProvider: URLProviding {

    var url: String = "https://api.bincodes.com/cc/json"

}
