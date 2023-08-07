//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double{
        
        
        get{
            
            guard let number = Double(displayLabel.text!)else{
                fatalError("Cannot convert display lable text to a number")
            }
            return number
        }
        
        set{
            
            displayLabel.text = String(newValue)
            
        }
        
    }
    
    private var calculator = CalculatorLogin()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
       
 
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{

            guard let result = calculator.calculate(symbol: calcMethod) else{
                fatalError("The result of calculation is nil")
            }
            
            displayValue = result
            
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                
                if sender.currentTitle == "."{
                    
                 
                    
                    var isInt = floor(displayValue) == displayValue
                        
                        if !isInt {
                        return
                    }
                    
                }
                
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
       
        
    }

}

