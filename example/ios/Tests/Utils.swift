import XCTest

func compare<T>(name: String,
                decode: ([String: Any?]) -> T?,
                encode: (T) -> () -> [String: Any?]?,
                omit: [String] = []
) {
    compareSingle(name: name, decode: decode, encode: encode, omit: omit)
    compareSingle(name: name + "Nullable", decode: decode, encode: encode, omit: omit)
}

func compareSingle<T>(name: String,
                      decode: ([String: Any?]) -> T?,
                      encode: (T) -> () -> [String: Any?]?,
                      omit: [String] = []
) {
    do {
        var expected = try readJSONFile(forName: name)
        for s in omit {
            expected = omitDeep(dict: expected, path: s.components(separatedBy: "."), index: 0)
        }
        var actual = encode(decode(expected)!)()!
        for s in omit {
            actual = omitDeep(dict: actual, path: s.components(separatedBy: "."), index: 0)
        }
        actual = removeNulls(input: actual)
        XCTAssertEqual(expected as NSDictionary, actual as NSDictionary)
    } catch { }
}

func omitDeep(dict: [String: Any?], path: [String], index: Int) -> [String: Any?] {
    var mutableDict = dict
    if (index < path.count - 1) {
        if(dict[path[index]] == nil) {
            return dict // not found
        }
        let node = dict[path[index]]
        if (node is [String : Any?]) {
            mutableDict[path[index]] = omitDeep(dict: node as! [String : Any?], path: path, index: index + 1)
        } else if (node is Array<Any?>) {
            mutableDict[path[index]] = omitDeep(arr: node as! Array<Any?>, path: path, index: index + 1)
        }
    } else {
        mutableDict.removeValue(forKey: path[index])
    }
    return mutableDict
}

func omitDeep(arr: Array<Any?>, path: [String], index: Int) -> Array<Any?> {
    var mutableArr = arr
    for (i, item) in arr.enumerated() {
        mutableArr[i] = omitDeep(dict: item as! [String : Any?], path: path, index: index)
    }
    return mutableArr
}

func removeNulls(input: [String: Any?]) -> [String: Any?] {
    var result = input
    for (key, value) in input {
        if (value == nil || value as! NSObject == NSNull()) {
            result.removeValue(forKey: key)
        } else if (value is [String: Any?]) {
            result[key] = removeNulls(input: value as! [String: Any?])
        } else if (value is Array<Any?>) {
            result[key] = removeNulls(arr: value as! Array<Any?>)
        }
    }
    return result
}

func removeNulls(arr: Array<Any?>) -> Array<Any?> {
    var mutableArr = arr
    for (i, item) in arr.enumerated() {
        if (item == nil || item as! NSObject == NSNull()) {
            mutableArr.remove(at: i)
        } else if (item is [String: Any?]) {
            mutableArr[i] = removeNulls(input: item as! [String: Any?])
        } else if (item is Array<Any?>) {
            mutableArr[i] = removeNulls(arr: item as! Array<Any?>)
        }
    }
    return mutableArr
}

func readJSONFile(forName name: String) throws -> [String: Any?] {
    do {
        let path = Bundle(for: Tests.self).path(forResource: "json/" + name, ofType: "json")
        if(path == nil){
            throw "file not found"
        }
        let data = try String(contentsOfFile: path!).data(using: .utf8)!
        return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String: Any?]
    } catch {
        throw(error)
    }
}

extension String: Error {}
