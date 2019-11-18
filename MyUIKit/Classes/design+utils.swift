//
//  design+utils.swift
//  ARIUIKit
//
//  Created by Séraphin Desumeur on 29/08/2019.
//

import Foundation

public extension UIColor {
    
    convenience init?(rgba: String) {
        
        let safeRgba = rgba
            .replacingOccurrences(of: "rgba(", with: "")
            .replacingOccurrences(of: ")", with: "")
        let rgbaArr = safeRgba
            .split(separator: ",")
            .compactMap { String($0) }
            .compactMap { NumberFormatter().number(from: $0) }
            .compactMap { CGFloat(truncating: $0) }
        
        guard rgbaArr.count == 4 else { return nil }
        
        self.init(displayP3Red: rgbaArr[0]/255,
                  green: rgbaArr[1]/255,
                  blue: rgbaArr[2]/255,
                  alpha: rgbaArr[3])
    }
}

public struct TextStyle {
    public let color: UIColor?
    public let fontFamily: String
    public let fontSize: CGFloat
    public let shouldApplyWeight: Bool
    public let fontWeight: CGFloat
    public let lineHeight: CGFloat
    public let letterSpacing: String
    public let textTransform: String
    
    public init(color: UIColor?,
                fontFamily: String,
                fontSize: CGFloat,
                shouldApplyWeight: Bool,
                fontWeight: CGFloat,
                lineHeight: CGFloat,
                letterSpacing: String,
                textTransform: String) {
        self.color = color
        self.fontFamily = fontFamily
        self.fontSize = fontSize
        self.shouldApplyWeight = shouldApplyWeight
        self.fontWeight = fontWeight
        self.lineHeight = lineHeight
        self.letterSpacing = letterSpacing
        self.textTransform = textTransform
    }
}

public extension UILabel {
    func setStyle(_ style: TextStyle) {
        textColor = style.color
        font = UIFont(name: style.fontFamily, size: style.fontSize)
    }
}
