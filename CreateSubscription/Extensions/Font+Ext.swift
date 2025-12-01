//
//  Font+Ext.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import UIKit
import SwiftUI

extension UIFont {
    static func graphik(size: CGFloat, weight: Font.Weight = .regular) -> UIFont? {
        var name: String = "GraphikTrial"
        switch weight {
        case .medium:
            name += "-Medium"
        case .semibold:
            name += "-Semibold"
        case .bold:
            name += "-Bold"
        case .heavy:
            name += "-Heavy"
        case .black:
            name += "-Black"
        default:
            name += "-Regular"
        }
        guard let font = UIFont(name: name, size: size) else {
            registeredFonts()
            assertionFailure("Can't find font name \(name)")
            return nil
        }
        return font
    }
    
    static func registeredFonts() {
        UIFont.familyNames.forEach { item in
            print(item)
            UIFont.fontNames(forFamilyName: item).forEach { name in
                print("Names: \(name)")
            }
        }
    }
}

extension Font {
    static func graphik(size: CGFloat, weight: Font.Weight) -> Font {
        let font = UIFont.graphik(size: size, weight: weight)!
        return Font(font)
    }
}
