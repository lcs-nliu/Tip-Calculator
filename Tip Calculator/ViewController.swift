//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Liu, Bojun on 2019-10-10.
//  Copyright © 2019 Liu, Nicole. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    // MARK: Properties
    
    
    //Establish Button Pressed as a false boolean
    var buttonPressed: Bool = false
    var tipPercent = Double (0.0)
    
    // Connected text field of bill amount to controller using an outlet
    @IBOutlet weak var amountOfBillEntered: UITextField!
    
    // Connected text field of people to controller using an outlet
    
    @IBOutlet weak var amountOfPeopleEntered: UITextField!
    

    // Connected total label to controller using an outlet
    @IBOutlet weak var totalTipLabel: UILabel!
    
    // Connected tip per person label to controller using an outlet
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
    // Connected error label to controller using an outlet
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    // MARK: Methods
    
    // Runs as soon as the view becomes visible to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Connected tip buttons to controller using actions

    @IBAction func tip5(_ sender: Any) {
        tipPercent = 0.05
        buttonPressed = true
    }
    
    @IBAction func tip10(_ sender: Any) {
        tipPercent = 0.10
        buttonPressed = true
    }
    
    @IBAction func tip15(_ sender: Any) {
        tipPercent = 0.15
        buttonPressed = true
    }
    
    @IBAction func tip20(_ sender: Any) {
        tipPercent = 0.20
        buttonPressed = true
    }
 
     //  Obtain the amount of bill value from the text field
    @IBAction func calculateTip(_ sender: Any) {
      
    // Check if a tip option is selected
        if buttonPressed == false {
            errorLabel.text = "Error. Please check all fields are completed."
            return
        }
    
    // Check if amount of bill has a value
        guard let amountOfBillString = amountOfBillEntered.text, amountOfBillString != ""  else {
            errorLabel.text = "Error. Please check all fields are completed."
            return
    }
        
    // Check if amount of people has a value
        guard let amountOfPeopleString = amountOfPeopleEntered.text, amountOfPeopleString != ""  else {
            errorLabel.text = "Error. Please check all fields are completed."
            return
        }

    // Try to convert the string into an double data type display error message if cannot be converted
            guard let amountOfBillDouble = Double(amountOfBillString) else {
            errorLabel.text = "Error. Please enter a number."
                return
            }
            
    /* guard let amountOfPeopleDouble = Double(amountOfPeopleString) else {
            //   errorLabel.text = "Error. Please enter a number."
            //   return
    } */
      
        
        
        // Calculate tip amount
        let tipAmount = amountOfBillDouble * tipPercent

        // Round the value to 2 decimal places
        let roundedtipAmount = (round(100*tipAmount)/100)
        
        // Change tip amount into a string
        let tipAmountString = String(roundedtipAmount)
        
        // Share information to the user interface
        totalTipLabel.text = "Total Tip: \(tipAmountString)$"
        
        // Calculate tip per person
        let tipAmountPerPerson = tipAmount/2
        
        // Round the value to 2 decimal places
        let roundedTipAmountPerPerson = (round(100*tipAmountPerPerson)/100)
        
        // Change tip per person into a string
        let roundedTipAmountPerPersonString = String(roundedTipAmountPerPerson)
        
        // Share information to the user interface
        tipPerPersonLabel.text = "Tip Per Person: \(roundedTipAmountPerPersonString)$"
        
        

    
}

}
