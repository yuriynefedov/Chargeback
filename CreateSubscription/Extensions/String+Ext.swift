//
//  String+Ext.swift
//  CreateSubscription
//
//  Created by Artem Kedrov on 01.12.2025.
//

import Foundation

extension String {
    var camelToTitleCase: String {
        let result = replacing(/[[:upper:]]/) { " " + $0.output }.capitalized
        return result.trimmingCharacters(in: .whitespaces)
    }
    
    var snakeCased: String {
        let pattern = "([a-z0-9])([A-Z])"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(self.startIndex..., in: self)
        let snake = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2")
        return snake.lowercased()
    }
}
