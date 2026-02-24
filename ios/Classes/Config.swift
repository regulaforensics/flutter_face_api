import UIKit
import FaceSDK

func setCustomization(_ it: [String: [String: Any]]) {
    for (key, value) in it {
        if key == "uiCustomizationLayer" {
            face.customization.customUILayerJSON = value as [AnyHashable : Any]
            continue
        }
        let dict = (face.customization.configuration!.value(forKey: key) as! NSMutableDictionary)
        for (k, v) in value {
            let k = Int(k)!
            switch key {
            case("colors"): dict[k] = UIColor.decode(v)
            case("fonts"): dict[k] = UIFont.decode(v)
            case("images"): dict[k] = UIImage.decode(v)
            default: break
            }
        }
    }
}

public extension FaceCaptureConfiguration {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(builder: { builder in
            for (k, v) in it {
                switch k {
                case("copyright"): builder.isCopyright = v as! Bool
                case("cameraSwitchEnabled"): builder.isCameraSwitchButtonEnabled = v as! Bool
                case("closeButtonEnabled"): builder.isCloseButtonEnabled = v as! Bool
                case("torchButtonEnabled"): builder.isTorchButtonEnabled = v as! Bool
                case("vibrateOnSteps"): builder.vibrateOnSteps = v as! Bool
                case("detectOcclusion"): builder.detectOcclusion = v as! Bool
                case("showFaceAnimation"): builder.showFaceAnimation = v as! Bool
                case("cameraPositionIOS"): builder.cameraPosition = CameraPosition(rawValue: v as! Int)!
                case("screenOrientation"): builder.screenOrientation = RFSScreenOrientation.decode(v)
                case("timeout"): builder.timeoutInterval = v as? NSNumber
                case("holdStillDuration"): builder.holdStillDuration = v as? NSNumber
                default: break
                }
            }
        })
    }
    func encode() -> [String: Any?] {
        return [
            "copyright": self.isCopyright,
            "cameraSwitchEnabled": self.isCameraSwitchButtonEnabled,
            "closeButtonEnabled": self.isCloseButtonEnabled,
            "torchButtonEnabled": self.isTorchButtonEnabled,
            "vibrateOnSteps": self.vibrateOnSteps,
            "detectOcclusion": self.detectOcclusion,
            "showFaceAnimation": self.showFaceAnimation,
            "cameraPositionIOS": self.cameraPosition.rawValue,
            "screenOrientation": self.screenOrientation.encode(),
            "timeout": self.timeoutInterval,
            "holdStillDuration": self.holdStillDuration,
        ]
    }
}

public extension LivenessConfiguration {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(builder: { builder in
            for (k, v) in it {
                switch k {
                case("copyright"): builder.isCopyright = v as! Bool
                case("cameraSwitchEnabled"): builder.isCameraSwitchButtonEnabled = v as! Bool
                case("closeButtonEnabled"): builder.isCloseButtonEnabled = v as! Bool
                case("torchButtonEnabled"): builder.isTorchButtonEnabled = v as! Bool
                case("vibrateOnSteps"): builder.vibrateOnSteps = v as! Bool
                case("cameraPositionIOS"): builder.cameraPosition = CameraPosition(rawValue: v as! Int)!
                case("attemptsCount"): builder.attemptsCount = v as! Int
                case("locationTrackingEnabled"): builder.isLocationTrackingEnabled = v as! Bool
                case("recordingProcess"): builder.recordingProcess = RecordingProcess(rawValue: v as! Int)!
                case("livenessType"): builder.livenessType = LivenessType(rawValue: v as! Int)!
                case("screenOrientation"): builder.screenOrientation = RFSScreenOrientation.decode(v)
                case("tag"): builder.tag = v as? String
                case("skipStep"): builder.stepSkippingMask = RFSLivenessStepSkip.decode(v)
                case("metadata"): builder.metadata = v as! [String: Any]
                default: break
                }
            }
        })
    }
    func encode() -> [String: Any?] {
        return [
            "copyright": self.isCopyright,
            "cameraSwitchEnabled": self.isCameraSwitchButtonEnabled,
            "closeButtonEnabled": self.isCloseButtonEnabled,
            "torchButtonEnabled": self.isTorchButtonEnabled,
            "vibrateOnSteps": self.vibrateOnSteps,
            "cameraPositionIOS": self.cameraPosition.rawValue,
            "attemptsCount": self.attemptsCount,
            "locationTrackingEnabled": self.isLocationTrackingEnabled,
            "recordingProcess": self.recordingProcess.rawValue,
            "livenessType": self.livenessType.rawValue,
            "screenOrientation": self.screenOrientation.encode(),
            "tag": self.tag,
            "skipStep": self.stepSkippingMask.encode(),
            "metadata": self.metadata,
        ]
    }
}

public extension MatchFacesConfiguration {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(builder: { builder in
            for (k, v) in it {
                switch k {
                case("processingMode"): builder.processingMode = FaceSDK.ProcessingMode(rawValue: v as! Int)!
                case("locationTrackingEnabled"): builder.isLocationTrackingEnabled = v as! Bool
                default: break
                }
            }
        })
    }
    func encode() -> [String: Any?] {
        return [
            "processingMode": self.processingMode.rawValue,
            "locationTrackingEnabled": self.isLocationTrackingEnabled,
        ]
    }
}

// MARK: - Convetring

extension UIColor {
    // Create from a hex integer; supports #RGB, #ARGB, #RRGGBB, #AARRGGBB semantics
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? Int else { return nil }
        // Build hex string manually to preserve leading zeros when derived from integers
        var value = UInt32(truncatingIfNeeded: it)
        let digits = Array("0123456789ABCDEF")
        var hex = ""
        while value > 0 {
            let d = Int(value % 16)
            hex.insert(digits[d], at: hex.startIndex)
            value /= 16
        }
        if hex.isEmpty { hex = "0" }
        // If length is 5 or 7, pad a leading 0 to restore a lost leading nibble
        if hex.count == 5 || hex.count == 7 { hex = "0" + hex }
        let s = hex.uppercased()
        
        let a, r, g, b: CGFloat
        switch s.count {
        case 3: // RGB
            a = 1.0
            r = Self.component(from: s, start: 0, length: 1)
            g = Self.component(from: s, start: 1, length: 1)
            b = Self.component(from: s, start: 2, length: 1)
        case 4: // ARGB
            a = Self.component(from: s, start: 0, length: 1)
            r = Self.component(from: s, start: 1, length: 1)
            g = Self.component(from: s, start: 2, length: 1)
            b = Self.component(from: s, start: 3, length: 1)
        case 6: // RRGGBB
            a = 1.0
            r = Self.component(from: s, start: 0, length: 2)
            g = Self.component(from: s, start: 2, length: 2)
            b = Self.component(from: s, start: 4, length: 2)
        case 8: // AARRGGBB
            a = Self.component(from: s, start: 0, length: 2)
            r = Self.component(from: s, start: 2, length: 2)
            g = Self.component(from: s, start: 4, length: 2)
            b = Self.component(from: s, start: 6, length: 2)
        default:
            assertionFailure("Invalid color value: #\(s). Expected #RGB, #ARGB, #RRGGBB, or #AARRGGBB")
            return nil
        }
        return Self(red: r, green: g, blue: b, alpha: a)
    }
    
    // AARRGGBB integer representation as Int
    func encode() -> Int {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if !getRed(&r, green: &g, blue: &b, alpha: &a) {
            if let comps = cgColor.components {
                if comps.count == 2 { r = comps[0]; g = comps[0]; b = comps[0]; a = comps[1] }
                else if comps.count >= 4 { r = comps[0]; g = comps[1]; b = comps[2]; a = comps[3] }
            }
        }
        let aa = UInt32(lroundf(Float(a * 255)))
        let rr = UInt32(lroundf(Float(r * 255)))
        let gg = UInt32(lroundf(Float(g * 255)))
        let bb = UInt32(lroundf(Float(b * 255)))
        let composed: UInt32 = (aa << 24) | (rr << 16) | (gg << 8) | bb
        return Int(truncatingIfNeeded: composed)
    }
    
    private static func component(from hex: String, start: Int, length: Int) -> CGFloat {
        let startIdx = hex.index(hex.startIndex, offsetBy: start)
        let endIdx = hex.index(startIdx, offsetBy: length)
        let substr = String(hex[startIdx..<endIdx])
        let full = (length == 2) ? substr : substr + substr
        let value = UInt32(full, radix: 16) ?? 0
        return CGFloat(value) / 255.0
    }
}

extension UIFont {
    static func decode(_ it: Any?) -> Self? {
        guard let it = it as? [String: Any] else { return nil }
        return Self(name: it["name"] as! String,
                    size: it["size"] as! CGFloat)
    }
}

extension RFSScreenOrientation {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [Int]
        if it.contains(0) && it.contains(1) { return Self(arrayLiteral: .portrait, .landscape) }
        if it.contains(0) { return Self(arrayLiteral: .portrait) }
        if it.contains(1) { return Self(arrayLiteral: .landscape) }
        return Self(arrayLiteral: [])
    }
    func encode() -> [Int] {
        if self == .portrait { return [0] }
        if self == .landscape { return [1] }
        if self == [.portrait, .landscape] { return [0, 1] }
        return []
    }
}

extension RFSLivenessStepSkip {
    static func decode(_ it: Any?) -> Self {
        let it = it as! [Int]
        if it.contains(0) && it.contains(1) { return Self(arrayLiteral: .onboarding, .success) }
        if it.contains(0) { return Self(arrayLiteral: .onboarding) }
        if it.contains(1) { return Self(arrayLiteral: .success) }
        return Self(arrayLiteral: [])
    }
    func encode() -> [Int] {
        if self == .onboarding { return [0] }
        if self == .success { return [1] }
        if self == [.onboarding, .success] { return [0, 1] }
        return []
    }
}
