//
//  calculatorLogic.swift
//  Calculator
//
//  Created by Naman Dhiman on 02/07/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatorLogin{
    
   private var number: Double?
    
   private var intermediateCalculation: (n1: Double , calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
        
    mutating func calculate(symbol:String)->Double? {
   
        if let n = number{
            if symbol == "/+"{
                return  n * -1
            }
            else if symbol == "AC"{
                return 0
            }
            else if symbol == "%"{
                return n * 0.01
            }
        
            else if symbol == "="{
                return performTwoNumberCalculation(n2: n)
            }
            else{
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
  
    }
    
    private func performTwoNumberCalculation(n2: Double)-> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            
            
            switch operation{
            case "+":
                return n1 + n2
            
            case "-":
                return n1 - n2
                
            case "×":
                return n1 * n2
                
            case "÷":
                return n1 / n2
                
                
            default:
                fatalError("No operation found")
            }
            
        }
        return nil;
    }
    
}
