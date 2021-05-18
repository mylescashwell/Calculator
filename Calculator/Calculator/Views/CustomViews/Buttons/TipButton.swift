//
//  TipButton.swift
//  Calculator
//
//  Created by Myles Cashwell on 5/17/21.
//

import UIKit

class TipButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpButton()
    }
    
    func setUpButton() {
        setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(named: "calcBlue3")
        self.layer.cornerRadius = frame.width / 2
    }
}
