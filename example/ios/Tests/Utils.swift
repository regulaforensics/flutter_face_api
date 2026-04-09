import XCTest

func compare<T>(_ name: String,
                _ decode: ([String: Any]) -> T?,
                _ encode: (T) -> () -> [String: Any]?,
                omit: [String] = []
) {
    compareSingle(name, decode, encode, omit)
    compareSingle(name + "Nullable", decode, encode, omit)
}

func compareSingle<T>(_ name: String,
                      _ decode: ([String: Any]) -> T?,
                      _ encode: (T) -> () -> [String: Any]?,
                      _ omit: [String] = []
) {
    do {
        let expected = prepare(try readJSONFile(name), omit)
        var actual = encode(decode(expected)!)()!
        actual = removeNulls(prepare(actual, omit))
        XCTAssertEqual(expected as NSDictionary, actual as NSDictionary)
    } catch { }
}

func prepare(_ input: [String: Any], _ omit: [String]) -> [String: Any] {
    var result = input
    for node in omit {
        result = omitDeep(result, node.components(separatedBy: "."), 0)
    }
    return result
}

func omitDeep(_ input: [String: Any], _ path: [String], _ index: Int) -> [String: Any] {
    var result = input
    if index < path.count - 1 {
        guard let node = input[path[index]] else { return result } // not found
        if node is [String : Any] {
            result[path[index]] = omitDeep(node as! [String : Any], path, index + 1)
        } else if node is Array<Any> {
            result[path[index]] = omitDeep(node as! Array<Any>, path, index + 1)
        }
    } else {
        result.removeValue(forKey: path[index])
    }
    return result
}

func omitDeep(_ input: Array<Any>, _ path: [String], _ index: Int) -> Array<Any> {
    var result = input
    for (i, value) in input.enumerated() {
        result[i] = omitDeep(value as! [String : Any], path, index)
    }
    return result
}

func removeNulls(_ input: [String: Any]) -> [String: Any] {
    var result = input
    for (key, value) in input {
        if case Optional<Any>.none = value  {
            result.removeValue(forKey: key)
        } else if value as! NSObject == NSNull() {
            result.removeValue(forKey: key)
        } else if value is [String: Any] {
            result[key] = removeNulls(value as! [String: Any])
        } else if value is Array<Any> {
            result[key] = removeNulls(value as! Array<Any>)
        }
    }
    return result
}

func removeNulls(_ input: Array<Any>) -> Array<Any> {
    var result = input
    for (index, value) in input.enumerated() {
        if case Optional<Any>.none = value {
            result.remove(at: index)
        } else if value as! NSObject == NSNull() {
            result.remove(at: index)
        } else if value is [String: Any] {
            result[index] = removeNulls(value as! [String: Any])
        } else if value is Array<Any> {
            result[index] = removeNulls(value as! Array<Any>)
        }
    }
    return result
}

func readJSONFile(_ name: String) throws -> [String: Any] {
    do {
        let path = Bundle(for: Tests.self).path(forResource: "json/" + name, ofType: "json")
        if path == nil { throw "file not found" }
        let data = try String(contentsOfFile: path!).data(using: .utf8)!
        return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String: Any]
    } catch { throw(error) }
}

extension String: Error {}
