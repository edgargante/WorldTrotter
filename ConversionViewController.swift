//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Edgar on 5/10/16.
//  Copyright © 2016 Edgar Gante. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return(value - 32) * (5/9)
        } else {
            return nil
        }
    
        
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
        
    func updateCelsiusLabel() {
        if let value = celsiusValue {
        celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
                celsiusLabel.text = "???"
            }
        }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        print("Current text: \(textField.text)")
        print("Replacement text: \(string)")
        
        return true
        
    }
}

