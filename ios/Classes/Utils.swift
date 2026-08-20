public typealias Callback = (Any?) -> Void

var args: [Any?] = []
func args<T>(_ index: Int) -> T {
    return args[index] as! T
}

func argsNullable<T>(_ index: Int) -> T? {
    if args[index] is NSNull { return nil }
    return args[index] as! T?
}

extension Any? {
    func toSendable() -> Any {
        guard let self else { return NSNull() }
        if self is [String: Any?] || self is [Any?] {
            let data = try! JSONSerialization.data(withJSONObject: fixNulls(self), options: .prettyPrinted)
            return String(data: data, encoding: .utf8)!
        }
        return self
    }
}

func fixNulls(_ value: Any?) -> Any {
    guard let value else { return NSNull() }
    switch value {
    case let value as [String: Any]:
        var dict = [String: Any]()
        for (k, v) in value { dict[k] = fixNulls(v) }
        return dict
    case let value as [Any]: return value.map { fixNulls($0) }
    default: return value
    }
}

extension NSObject {
    static func allocate() -> NSObject {
        return perform(NSSelectorFromString("alloc")).takeUnretainedValue() as! NSObject
    }
    static func emptyInit<T>() -> T {
        return allocate().perform("init".selector()).takeUnretainedValue() as! T
    }
}

extension String {
    func selector() -> Selector {
        return NSSelectorFromString(self)
    }
}

func privateInit<T, Fn>(
    _ allocated: NSObject,
    _ selector: Selector,
    _ function: Fn.Type,
    _ call: (Fn) -> Unmanaged<AnyObject>?
) -> T {
    let f = unsafeBitCast(allocated.method(for: selector), to: function)
    return call(f)!.takeUnretainedValue() as! T
}

extension Data {
    static func decode(_ it: Any?) -> Self? {
        guard var it = it as? String else { return nil }
        if it.hasPrefix("data") { it = String(it[it.index(after: it.firstIndex(of: ",")!)...]) }
        return Self(base64Encoded: it)
    }
    
    func encode() -> String {
        return self.base64EncodedString()
    }
}

extension UIImage {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? String else { return nil }
        return Self(data: Data.decode(it)!)
    }
    
    func encode() -> String {
        return self.pngData()!.encode()
    }
}
