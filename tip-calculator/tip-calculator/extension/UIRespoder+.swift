//
//  UIRespoder+.swift
//  tip-calculator
//
//  Created by 이명진 on 2/25/24.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
