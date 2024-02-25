//
//  Tip.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fiftenPercent
    case twnetyPercent
    case custom(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            return ""
        case .tenPercent:
            return "10%"
        case .fiftenPercent:
            return "15%"
        case .twnetyPercent:
            return "20%"
        case .custom(let value):
            return String(value)
        }
    }
}

