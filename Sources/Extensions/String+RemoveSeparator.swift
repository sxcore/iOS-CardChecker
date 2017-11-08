extension String {
    static func removeSeparator(_ intoString: String) -> String {
        let charChunk: Int = 4
        let separator: String = " "
        var output = ""

        intoString.enumerated().forEach { index, symbol in
            if index % charChunk == 0 && index > 0 {
                output += separator
            }
            output.append(symbol)
        }
        return output
    }
}
