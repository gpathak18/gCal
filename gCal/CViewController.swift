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
    @IBOutlet weak var infoTextArea: UITextView!
    @IBOutlet weak var unitTextArea: UITextView!
    
    @IBOutlet weak var swapBtn: DesinableButtons!
    
    @IBOutlet var Container: UIView!
    
    @IBOutlet weak var conversionText: DesinableButtons!
    
    private var isUnitToggle = 0
    
    let swapImage = UIImage(named:"ic_swap_horiz_18pt")?.withRenderingMode(
        UIImageRenderingMode.alwaysTemplate)
    
    let cnvtImage = UIImage(named:"ic_filter_none_18pt")?.withRenderingMode(
        UIImageRenderingMode.alwaysTemplate)
    
    var convText: String = ""
    private var selectedText: String = ""
    private var operation: String = ""
    private var operand1: Double? = nil
    private var operand2: Double? = nil
    private var isClearDisplay: Int = 0
    private var operationPerformed = false
    private var isOperand2Required = false
    
    private var expressionText = ""
    
    private var isConvertorOn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        displayText.text = "0"
        
        conversionText.tintColor = UIColor(white:0, alpha:1)
        conversionText.setImage(cnvtImage, for:UIControlState.normal)
        
        //unitTextArea.text.minimumScaleFactor = 10/UIFont.labelFontSize
        //unitTextArea.adjustsFontSizeToFitWidth = true
        
        // self.conversionText.setTitle(PassData.sharedInstance.cnvrTxt, for: .normal)
    }
    
    @IBAction func unwindToCV(segue: UIStoryboardSegue) {
        unitTextArea.tintColor = UIColor.black
        
        if PassData.sharedInstance.from != nil && PassData.sharedInstance.to != nil {
            unitTextArea.text = PassData.sharedInstance.from.symbol + " to " + PassData.sharedInstance.to.symbol
            isConvertorOn = 1
            isUnitToggle = 1
            clearAll()
        }
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var text: String = displayText.text
        
        text = text.components(separatedBy: " ")[0]
        
        infoTextArea.text = infoTextArea.text.components(separatedBy: " ")[0]
        
        operationPerformed = false
        
        if text == "0" && sender.tag == 0 {
            text = "0"
            infoTextArea.text.append("")
        } else if text == "0" && sender.tag != 0 {
            text = String(sender.tag)
            infoTextArea.text.append(String(sender.tag))
        } else if isClearDisplay == 1 {
            isClearDisplay = 0
            text = String(sender.tag)
            infoTextArea.text.append(String(sender.tag))
        } else {
            text.append(String(sender.tag))
            infoTextArea.text.append(String(sender.tag))
        }
        
        if operation != "" && isOperand2Required {
            isOperand2Required = false
        }
        
        //infoTextArea.text = infoTextArea.text+String(sender.tag)
        
        if isConvertorOn == 1 {
            infoTextArea.text =  infoTextArea.text + " " + PassData.sharedInstance.from.symbol
        } else {
            
            displayText.text = text
            
        }
        
        
    }
    
    func clearAll() {
        displayText.text = "0"
        operand1 = nil
        operand2 = nil
        operation = ""
        isOperand2Required = false
        operationPerformed = false
        isClearDisplay = 0
        expressionText = ""
        infoTextArea.text = ""
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        clearAll()
        unitTextArea.text = ""
        isConvertorOn = 0
    }
    
    @IBAction func convertPressed(_ sender: Any) {
        
        //        UIView.animate(withDuration:0.5, animations: { () -> Void in
        //
        //            self.unitTextArea.transform = CGAffineTransform(rotationAngle: .pi)
        //        })
        
        var val: String = infoTextArea.text
        
        val = val.components(separatedBy: " ")[0]
        
        let convertedUnit = ConversionUtility.convert(category: PassData.sharedInstance.category, from: PassData.sharedInstance.from, to: PassData.sharedInstance.to, value: Double(val)!)
        
        if isUnitToggle == 0 {
            swapBtn.tintColor = UIColor(white:0, alpha:1)
            swapBtn.setImage(swapImage, for:UIControlState.normal)
            unitTextArea.text = PassData.sharedInstance.from.symbol + " to " + PassData.sharedInstance.to.symbol
            isUnitToggle = 1
        } else {
            unitTextArea.text = PassData.sharedInstance.to.symbol + " to " + PassData.sharedInstance.from.symbol
            isUnitToggle = 0
        }
        
        displayText.text = convertedUnit
        
        
    }
    @IBAction func dotPressed(sender: AnyObject) {
        
        if isConvertorOn == 0 {
            var text: String = displayText.text
            
            if text.range(of:".") == nil {
                
                if text == "0" {
                    text = "0."
                    infoTextArea.text.append(text)
                } else {
                    text.append(".")
                    infoTextArea.text.append(".")
                }
            }
            
            displayText.text = text
            
        } else {
            var text: String = infoTextArea.text.components(separatedBy: " ")[0]
            let unit: String = infoTextArea.text.components(separatedBy: " ")[1]
            
            if text.range(of:".") == nil {
                
                if text == "0" {
                    text = "0."
                    infoTextArea.text.append(text)
                } else {
                    text.append(".")
                    infoTextArea.text.append(".")
                }
            }
            
            infoTextArea.text = text + " " + unit
        }
        
    }
    
    @IBAction func signPressed(sender: AnyObject) {
        
        var text: String = displayText.text
        
        if text.hasPrefix("-") {
            text = String(text.characters.dropFirst(1))
        } else {
            text = "-" + text
        }
        
        displayText.text = text
        expressionText += text
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
        
        let chkOperation = chkOperSign()
        
        if (!chkOperation){
            
            if operation != "" && operation != "+" {
                performEqualOperation()
                operation = "+"
            } else {
                
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
            
            infoTextArea.text.append(operation)
            
        } else {
            
            infoTextArea.text = String(infoTextArea.text.characters.dropLast(1))
            operation = "+"
            infoTextArea.text.append(operation)
        }
    }
    
    @IBAction func subtractPressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        let chkOperation = chkOperSign()
        
        if (!chkOperation){
            
            if operation != "" && operation != "-" {
                performEqualOperation()
                operation = "-"
            } else{
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
            
            infoTextArea.text.append(operation)
            
        } else {
            
            infoTextArea.text = String(infoTextArea.text.characters.dropLast(1))
            operation = "-"
            infoTextArea.text.append(operation)
        }
    }
    
    @IBAction func multiplyPressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        let chkOperation = chkOperSign()
        
        if (!chkOperation){
            
            if operation != "" && operation != "*" {
                performEqualOperation()
                operation = "*"
            } else {
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
            
            infoTextArea.text.append("x")
        } else {
            
            infoTextArea.text = String(infoTextArea.text.characters.dropLast(1))
            operation = "*"
            infoTextArea.text.append("x")
        }
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
        
        let text: String = displayText.text
        let dblValue: Double = Double(text)!
        
        let chkOperation = chkOperSign()
        
        if (!chkOperation){
            
            if operation != "" && operation != "/" {
                performEqualOperation()
                operation = "/"
            } else {
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
            
            
            infoTextArea.text.append(operation)
            
        } else {
            
            infoTextArea.text = String(infoTextArea.text.characters.dropLast(1))
            operation = "/"
            infoTextArea.text.append(operation)
        }
    }
    
    private func chkOperSign() -> Bool {
        let text = infoTextArea.text
        if((text?.hasSuffix("+"))! || (text?.hasSuffix("-"))! || (text?.hasSuffix("x"))! || (text?.hasSuffix("/"))!){
            return true;
        } else {
            return false;
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
        
        let chkOperation = chkOperSign()
        
        if (!chkOperation){
            performEqualOperation()
        }
        
    }
    
    private func performEqualOperation() {
        
        
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
        
        operand2 = nil
    }
    
    
    
}
