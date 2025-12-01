//
//  Constants.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation
import SwiftUI

enum Constants {
    enum IconName: String {
        case icXmarkCircle
        case icPlusCircle
        case icChevronUpDown
        case icArrowBackCircle
        case icCheckmark
        var name: String {
            self.rawValue.snakeCased
        }
    }
    
    enum Colors: String {
        case mainBackground
        case subsCardBackground
        case textLightGray
        case textBlack
        case textDarkGray
        case toggleTint
        case thumbFill
        case focusStroke
        
        var name: String {
            self.rawValue.snakeCased
        }
    }
    
    enum Layout {
        static var cornerRadius: CGFloat { 16.0 }
        static var thumbCornerRadius: CGFloat { 6.0 }
    }
}
