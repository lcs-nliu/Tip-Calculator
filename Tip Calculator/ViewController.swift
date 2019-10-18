//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Liu, Bojun on 2019-10-10.
//  Copyright © 2019 Liu, Nicole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    //Establish Tip Amount
    var tipPercent = Double(0.0)
    
    var buttonPressed = false
    
    @IBAction func tip5(_ sender: Any) {
        tipPercent = 0.05
        buttonPressed = true
    }
    
    @IBAction func tip10(_ sender: Any) {
        tipPercent = 0.1
        buttonPressed = true
        
    }
    
    @IBAction func tip15(_ sender: Any) {
        tipPercent = 0.15
        buttonPressed = true
    }
    
    @IBAction func tip20(_ sender: Any) {
        tipPercent = 0.2
        buttonPressed = true
    }
    
    // Establish Bill Amount
    @IBOutlet weak var amountOfBill: UITextField!
    
    // Establish Amount of People
    @IBOutlet weak var amountOfPeople: UITextField!
    
    // Total Tip Label
    @IBOutlet weak var totalTipLabel: UILabel!
    
    // Tip Per Person Label
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
  // Error Label
    @IBOutlet weak var errorLabel: UILabel!
    
    
    //MARK: Methods
    

    @IBAction func calculate(_sender: Any) {

      
        
        // Take strings and turn them into doubles
        
        // If the string can't be converted to a double, diplay message to user
        guard let billAmountDouble = Double(amountOfBill) else{
            errorLabel.text = "Enter Usable Values"
            return
        }
        
        // If the string can't be converted to a double, diplay message to user
        guard let amountOfPeopleAsDouble = Double(amountOfPeople) else{
            errorLabel.text = "Enter Usable Values"
            return
        }
        
        
        // Calculate tip amount
        let tipAmountDouble = billAmountDouble * tipPercent
        
        // Round the value to 2 decimal places
        let roundedtipAmountDouble = (round(100*tipAmountDouble)/100)
        
        // Change tip amount into a string
        let tipAmountInDollarsasString = String(roundedtipAmountDouble)
        
        // Share information to the user interface
        totalTipLabel.text = "Total Tip: \(tipAmountInDollarsasString)$"
        
        // Calculate tip per person
        let tipAmountPerPerson = tipAmountDouble/amountOfPeopleAsDouble
        
        // Round the value to 2 decimal places
        let roundedTipPerPerson = (round(100*tipAmountPerPerson)/100)
        
        // Change tip per person into a string
        let tipPerPersonasString = String(roundedTipPerPerson)
        
        // Share information to the user interface
        tipPerPersonLabel.text = "Tip Per Person: \(tipPerPersonasString)$"
        
        
    }
    
}

