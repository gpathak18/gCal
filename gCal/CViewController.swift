//
//  CViewController.swift
//  gCal
//
//  Created by Gaurav Pathak on 2/27/17.
//  Copyright © 2017 Gaurav Pathak. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
    
    struct operations {
        
        let add: String = "+"
        let subtract: String = "-"
        let multiply: String = "x"
        let divide: String = "/"
        
    }
    
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
    private var isConvertorOn = 0
    
    //private var previousAns: Double = 0
    
    private var subExpresssion = ""
    private var isSubExp = false
    
    private var isEqualPressed = false
    
    private var currentNumber = ""
    
    private var expression = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        displayText.text = "0"
        conversionText.tintColor = UIColor(white:0, alpha:1)
        conversionText.setImage(cnvtImage, for:UIControlState.normal)
        swapBtn.setImage(swapImage, for:UIControlState.normal)
    }
    
    @IBAction func unwindToCV(segue: UIStoryboardSegue) {
        unitTextArea.tintColor = UIColor.black
        
        unitTextArea.text = PassData.sharedInstance.from.symbol + " to " + PassData.sharedInstance.to.symbol
        infoTextArea.text = "0 " + PassData.sharedInstance.from.symbol
        isConvertorOn = 1
        isUnitToggle = 1
        displayText.text = "0"
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        isEqualPressed = false
        var text: String = infoTextArea.text
        
        if isConvertorOn == 1 {
            text = text.components(separatedBy: " ")[0]
            if text == "0" {
                infoTextArea.text = ""
            } else {
                infoTextArea.text = text
            }
        }
        
        
        
        if text == "0" && sender.tag == 0 {
            text = "0"
            infoTextArea.text.append("")
            currentNumber = ""
        } else if text == "0" && sender.tag != 0 {
            text = String(sender.tag)
            infoTextArea.text.append(String(sender.tag))
            currentNumber.append(String(sender.tag))
        } else {
            text.append(String(sender.tag))
            infoTextArea.text.append(String(sender.tag))
            currentNumber.append(String(sender.tag))
        }
        
        
        
        //infoTextArea.text = infoTextArea.text+String(sender.tag)
        
        if isConvertorOn == 1 {
            
            infoTextArea.text =  infoTextArea.text + " " + PassData.sharedInstance.from.symbol
            
            var val: String = infoTextArea.text
            
            val = val.components(separatedBy: " ")[0]
            
            let convertedUnit = ConversionUtility.convert(category: PassData.sharedInstance.category, from: PassData.sharedInstance.from, to: PassData.sharedInstance.to, value: Double(val)!)
            
            displayText.text = convertedUnit
        }
        
        
        
    }
    
    
    @IBAction func clearPressed(sender: AnyObject) {
        infoTextArea.text = ""
        unitTextArea.text = ""
        displayText.text = "0"
        isConvertorOn = 0
        isSubExp = false
        subExpresssion = ""
        currentNumber = ""
    }
    
    @IBAction func convertPressed(_ sender: Any) {
        
        //        UIView.animate(withDuration:0.5, animations: { () -> Void in
        //
        //            self.unitTextArea.transform = CGAffineTransform(rotationAngle: .pi)
        //        })
        
        if isConvertorOn == 1 {
            
            var val: String = infoTextArea.text
            
            val = val.components(separatedBy: " ")[0]
            
            if isUnitToggle == 0 {
                unitTextArea.text = PassData.sharedInstance.from.symbol + " to " + PassData.sharedInstance.to.symbol
                infoTextArea.text =  val + " " + PassData.sharedInstance.from.symbol
                let convertedUnit = ConversionUtility.convert(category: PassData.sharedInstance.category, from: PassData.sharedInstance.from, to: PassData.sharedInstance.to, value: Double(val)!)
                
                displayText.text = convertedUnit
                isUnitToggle = 1
            } else {
                unitTextArea.text = PassData.sharedInstance.to.symbol + " to " + PassData.sharedInstance.from.symbol
                infoTextArea.text =  val + " " + PassData.sharedInstance.to.symbol
                let convertedUnit = ConversionUtility.convert(category: PassData.sharedInstance.category, from: PassData.sharedInstance.to, to: PassData.sharedInstance.from, value: Double(val)!)
                
                displayText.text = convertedUnit
                isUnitToggle = 0
            }
            
        }
        
    }
    @IBAction func dotPressed(sender: AnyObject) {
        isEqualPressed = false
        if isConvertorOn == 0 {
            var text: String = currentNumber
            
            if text.range(of:".") == nil {
                
                if  text == "0" || text == ""{
                    text = "0."
                    infoTextArea.text=text
                    currentNumber = text+currentNumber
                } else {
                    text.append(".")
                    infoTextArea.text.append(".")
                    currentNumber.append(".")
                }
            }
            
            //displayText.text = text
            
        } else {
            
            let text: String = infoTextArea.text
            
            if text.range(of:".") == nil {
                
                var text: String = infoTextArea.text.components(separatedBy: " ")[0]
                let unit: String = infoTextArea.text.components(separatedBy: " ")[1]
                
                if text == "0" || text == "" {
                    text = "0."
                    infoTextArea.text = text
                } else {
                    text.append(".")
                    infoTextArea.text.append(".")
                }
                
                infoTextArea.text = text + " " + unit
            }
            
            
        }
        
    }
    
    @IBAction func signPressed(sender: AnyObject) {
        isEqualPressed = false
        var text: String = infoTextArea.text
        
        if text.hasPrefix("-") {
            text = String(text.characters.dropFirst(1))
        } else {
            text = "-" + text
        }
        
        infoTextArea.text = text
        
    }
    
    @IBAction func percentPressed(sender: AnyObject) {
        isEqualPressed = false
        var text: String = displayText.text
        
        text = String(Double(text)!/100)
        
        displayText.text = text
        
    }
    
    @IBAction func sqrtPressed(sender: AnyObject) {
        isEqualPressed = false
        var dblValue: Double = Double(displayText.text)!
        
        dblValue = sqrt(dblValue)
        
        displayResult(result: dblValue)
        
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
        
        
        
        
        if checkForAnswer() {
            
            //  previousAns = Double(displayText.text)!
            
            if infoTextArea.text.hasPrefix("{") && !isEqualPressed {
                infoTextArea.text.append(" "+operations().add + " ")
            } else {
                infoTextArea.text = "{Ans} ".appending(operations().add + " ")
            }
            
            isSubExp = true
            
        } else {
            
            infoTextArea.text.append(" " + operations().add + " ")
            
        }
        
    
        
        expression += String(describing: Double(currentNumber))
        expression.append(operations().add)
        
        isEqualPressed = false
        currentNumber = ""
        
    }
    
    @IBAction func subtractPressed(sender: AnyObject) {
        
        if checkForAnswer() {
            
            // previousAns = Double(displayText.text)!
            
            if infoTextArea.text.hasPrefix("{") && !isEqualPressed{
                infoTextArea.text.append(" "+operations().subtract + " ")
            } else {
                infoTextArea.text = "{Ans} ".appending(operations().subtract + " ")
            }
            
            isSubExp = true
            
            
        } else {
            
            infoTextArea.text.append(" " + operations().subtract + " ")
            
        }
        
        isEqualPressed = false
        currentNumber = ""
        
    }
    
    @IBAction func multiplyPressed(sender: AnyObject) {
        
        if checkForAnswer() {
            
            if infoTextArea.text.hasPrefix("{") && !isEqualPressed {
                infoTextArea.text.append(" "+operations().multiply + " ")
            } else {
                infoTextArea.text = "{Ans} ".appending(operations().multiply + " ")
            }
            
            isSubExp = true
            
            
        } else {
            
            infoTextArea.text.append(" " + operations().multiply + " ")
            
        }
        
        isEqualPressed = false
        currentNumber = ""
    }
    
    @IBAction func dividePressed(sender: AnyObject) {
        
        
        if checkForAnswer() {
            
            //previousAns = Double(displayText.text)!
            
            if infoTextArea.text.hasPrefix("{") && !isEqualPressed{
                infoTextArea.text.append(" "+operations().divide + " ")
            } else {
                infoTextArea.text = "{Ans} ".appending(operations().divide + " ")
            }
            
            isSubExp = true
            
            
        } else {
            
            infoTextArea.text.append(" " + operations().divide + " ")
            
        }
        
        isEqualPressed = false
        currentNumber = ""
    }
    
    private func checkForAnswer() -> Bool {
        
        if displayText.text == "0" {
            return false
        } else {
            return true
        }
    }
    
    
    
    @IBAction func equalPressed(sender: AnyObject) {
        if isConvertorOn == 0 {
            currentNumber = ""
            var numericExpression: String = ""
            
            if isSubExp  {
                
                numericExpression = subExpresssion + infoTextArea.text.components(separatedBy: "}")[1]
                
            } else {
                numericExpression = infoTextArea.text
            }
            
            numericExpression = numericExpression.trimmingCharacters(in: .whitespaces)
            numericExpression = numericExpression.replacingOccurrences(of: "x", with: "*")
            
            let expression = NSExpression(format: numericExpression)
            
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            
            subExpresssion = String(result)
            
            displayResult(result: result)
            
            isEqualPressed = true
            
            
        }
        
    }
    
    
}
