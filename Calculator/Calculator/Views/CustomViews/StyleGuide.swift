//
//  StyleGuide.swift
//  Calculator
//
//  Created by Myles Cashwell on 5/17/21.
//

import UIKit

extension UIView {
    func addAccentBorder(width: CGFloat = 2, color: UIColor = .darkGray) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
