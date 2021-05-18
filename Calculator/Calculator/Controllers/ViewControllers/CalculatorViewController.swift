//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Myles Cashwell on 5/17/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var tipAmountTextField: UITextField!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var youllTipLabel: UILabel!
    
    @IBOutlet weak var overallTotalLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        totalAmountTextField.delegate = self
        tipAmountTextField.delegate = self
    }
    
    
    //MARK: - Actions
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let billAmount = totalAmountTextField.text, !billAmount.isEmpty,
              let tipAmount = tipAmountTextField.text, !tipAmount.isEmpty else { return }
        
        let total = Double(billAmount)!
        let tip = (Double(tipAmount)! / 100) * total
        
        overallTotalLabel.isHidden = false
        overallTotalLabel.text = "Total: $\(tip + total)"
        overallTotalLabel.textColor = .white
        
        youllTipLabel.isHidden = false
        tipTotalLabel.isHidden = false
        tipTotalLabel.text = String(format: "$%.02f", tip)
    }
    
    @IBAction func mainViewTapped(_ sender: Any) {
        totalAmountTextField.resignFirstResponder()
        tipAmountTextField.resignFirstResponder()
    }
    
    //MARK: - Functions
    func setUpViews() {
        billAmountLabel.textColor = .white
        tipPercentLabel.textColor = .white
        
        youllTipLabel.isHidden = true
        youllTipLabel.textColor = .white
        
        tipTotalLabel.isHidden = true
        overallTotalLabel.isHidden = true
        
        
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.startPoint = CGPoint(x: 0, y: 0)
        gradientBackground.endPoint = CGPoint(x: 1, y: 1)
        gradientBackground.colors = [UIColor(named: "calcBlue")?.cgColor ?? UIColor.systemBlue.cgColor,
                                UIColor(named: "calcBlue2")?.cgColor ?? UIColor.systemTeal.cgColor]
        backgroundView.layer.addSublayer(gradientBackground)
    }
}

//MARK: - Extensions
extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
}
