//  ViewController.swift
//  calculatorMeow
//
//  Created by Nekokoatl on 30/04/16.

import UIKit

class ViewController: UIViewController {

    
    

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool  = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
                                            }
         else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
              }
                                                 }
    
    
    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        //append здесь
        print("operandStack = \(operandStack)")
                            }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        switch operation {
        case "✖︎" : performOperation { $0 * $1 }
        case "⁒" : performOperation { $0 / $1 }
        case "⎯" : performOperation { $0 - $1 }
        case "✚" : performOperation { $0 + $1 }
        case "√" : performOperation1 { sqrt($0) }

        default: break
                         }
                                             }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
             enter()
                                    }
                                                                 }
    
    func performOperation1(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter() }
                                                        }
    
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            }
        
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
            }
                            }



                                          }

