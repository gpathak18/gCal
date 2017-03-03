//
//  CViewController.swift
//  gCal
//
//  Created by Gaurav Pathak on 2/27/17.
//  Copyright © 2017 gpmax. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
    
    @IBOutlet weak var displayText: UITextView!
    
    private var operation = ""
    private var operand1: Double? = nil
    private var operand2: Double? = nil
    private var isClearDisplay: Int = 0
    private var operationPerformed = false
    private var isOperand2Required = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        displayText.text = "0"
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var text: String = displayText.text
        
        operationPerformed = false
        
        if text == "0" && sender.tag == 0 {
            text = "0"
        } else if text == "0" && sender.tag != 0 {
            text = String(sender.tag)
        } else if isClearDisplay == 1 {
            isClearDisplay = 0
            text = String(sender.tag)
        } else {
            text.append(String(sender.tag))
        }
        
        if operation != "" && isOperand2Required {
            isOperand2Required = false
        }
        
        displayText.text = text
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        
        displayText.text = "0"
        operand1 = nil
        operand2 = nil
        operation = ""
        isOperand2Required = false
        operationPerformed = false
        
    }
    
    @IBAction func dotPressed(sender: AnyObject) {
        
        var text: String = displayText.text
        
        if text.range(of:".") == nil {
            
            if text == "0" {
                text = "0."
            } else {
                text.append(".")
            }
        }
        
        displayText.text = text
    }
    
    @IBAction func signPressed(sender: AnyObject) {
        
        var text: String = displayText.text
        
        if text.hasPrefix("-") {
            text = String(text.characters.dropFirst(1))
        } else {
            text = "-" + text
        }
        
        displayText.text = text
    }
    
    @IBAction func percentPressed(sender: AnyObject) {
        
        var text: String = displayText.text
        
        text = String(Double(text)!/100)
        
        displayText.text = text
        
        isClearDisplay = 1
    }
    
    @IBAction func sqrtPressed(sender: AnyObject) {
        
        var dblValue: Double = Double(displayText.text)!
        
        dblValue = sqrt(dblValue)
        
        displayResult(result: dblValue)
        
        isClearDisplay = 1
    }
    
    private func displayResult(result: Double){
        
        var text = ""
        
        if floor(result) == result {
            text = String(format: "%.0f", result)
        } else {
            text = String(result)
        }
        
        displayText.text = text
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        operation = "+"
        if !operationPerformed && !isOperand2Required {
            if operand1 == nil {
                operand1 = dblValue
                isOperand2Required = true
            } else {
                operand2 = dblValue
                isOperand2Required = false
                addPressed()
                operand2 = nil
                operationPerformed = true
            }
            isClearDisplay = 1
        }
    }
    
    @IBAction func subtractPressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        operation = "-"
        if !operationPerformed && !isOperand2Required {
            if operand1 == nil {
                operand1 = dblValue
                isOperand2Required = true
            } else {
                operand2 = dblValue
                isOperand2Required = false
                subtractPressed()
                operand2 = nil
                operationPerformed = true
            }
            isClearDisplay = 1
        }
    }
    
    @IBAction func multiplyPressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        operation = "*"
        if !operationPerformed && !isOperand2Required {
            if operand1 == nil {
                operand1 = dblValue
                isOperand2Required = true
            } else {
                operand2 = dblValue
                isOperand2Required = false
                multiplyPressed()
                operand2 = nil
                operationPerformed = true
            }
            isClearDisplay = 1
        }
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        operation = "/"
        if !operationPerformed && !isOperand2Required {
            if operand1 == nil {
                operand1 = dblValue
                isOperand2Required = true
            } else {
                operand2 = dblValue
                isOperand2Required = false
                dividePressed()
                operand2 = nil
                operationPerformed = true
            }
            isClearDisplay = 1
        }
    }
    
    private func dividePressed() {
        let dblValue = divide(a: operand1!, b: operand2!)
        operand1 = dblValue
        displayResult(result: dblValue)
    }
    
    private func multiplyPressed() {
        let dblValue = multiply(a: operand1!, b: operand2!)
        operand1 = dblValue
        displayResult(result: dblValue)
    }
    
    private func subtractPressed() {
        let dblValue = subtract(a: operand1!, b: operand2!)
        operand1 = dblValue
        displayResult(result: dblValue)
    }
    
    private func addPressed() {
        let dblValue = addition(a: operand1!, b: operand2!)
        operand1 = dblValue
        displayResult(result: dblValue)
    }
    
    private func addition(a: Double, b: Double) -> Double {
        return a+b
    }
    
    private func multiply(a: Double, b: Double) -> Double {
        return a*b
    }
    
    private func divide(a: Double, b: Double) -> Double {
        return a/b
    }
    
    private func subtract(a: Double, b: Double) -> Double {
        return a-b
    }
    
    @IBAction func equalPressed(sender: AnyObject) {
        
        let dblValue: Double = Double(displayText.text)!
        
        switch operation {
            
        case "+":
            
            if operand2 == nil {
                operand2 = dblValue
            }
            addPressed()
            isClearDisplay = 1
            
        case "-":
            
            if operand2 == nil {
                operand2 = dblValue
            }
            subtractPressed()
            isClearDisplay = 1
            
        case "*":
            
            if operand2 == nil {
                operand2 = dblValue
            }
            multiplyPressed()
            isClearDisplay = 1
            
        case "/":
            
            if operand2 == nil {
                operand2 = dblValue
            }
            dividePressed()
            isClearDisplay = 1
            
        default:
            
            displayText.text = "ERROR!"
            
        }
        
    }
    
    
    
}
