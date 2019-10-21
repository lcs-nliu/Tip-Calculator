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
    
    
    // Establish Button Pressed as a false boolean
    var buttonPressed: Bool = false
    // Establish tip percent as a double data type with decimal places
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
    
     // Connected tip buttons to controller using outlets
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonFifteen: UIButton!
    @IBOutlet weak var buttonTwenty: UIButton!
    
    
    // MARK: Methods
    
    // Runs as soon as the view becomes visible to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Connected tip buttons to controller using actions so that every time one tip button is pressed, tip percent is set to 0.05, bool is set to true, and button background colour is set to blue

    @IBAction func tip5(_ sender: Any) {
        tipPercent = 0.05
        buttonPressed = true
        buttonFive.backgroundColor = UIColor.blue
        buttonTen.backgroundColor = UIColor.darkGray
        buttonFifteen.backgroundColor = UIColor.darkGray
        buttonTwenty.backgroundColor = UIColor.darkGray
        // could make a function for this but not really sure how (I know it's redundant code)
    }
    
    @IBAction func tip10(_ sender: Any) {
        tipPercent = 0.10
        buttonPressed = true
        buttonTen.backgroundColor = UIColor.blue
        buttonFive.backgroundColor = UIColor.darkGray
        buttonFifteen.backgroundColor = UIColor.darkGray
        buttonTwenty.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func tip15(_ sender: Any) {
        tipPercent = 0.15
        buttonPressed = true
        buttonFifteen.backgroundColor = UIColor.blue
        buttonFive.backgroundColor = UIColor.darkGray
        buttonTen.backgroundColor = UIColor.darkGray
        buttonTwenty.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func tip20(_ sender: Any) {
        tipPercent = 0.20
        buttonPressed = true
        buttonFive.backgroundColor = UIColor.darkGray
        buttonTen.backgroundColor = UIColor.darkGray
        buttonFifteen.backgroundColor = UIColor.darkGray
        buttonTwenty.backgroundColor = UIColor.blue
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
            
    guard let amountOfPeopleDouble = Double(amountOfPeopleString) else {
            //   errorLabel.text = "Error. Please enter a number."
             return
    }
      
        
        
        // Calculate tip amount, round it, and chnage it into a string
        let tipAmount = amountOfBillDouble * tipPercent
        let roundedtipAmount = (round(100*tipAmount)/100)
        let tipAmountString = String(roundedtipAmount)
        
        // Share information to the user interface
        totalTipLabel.text = "The total tip amount is: \(tipAmountString)$"
        
        // Calculate tip per person, round it, and change it into a string
        let tipAmountPerPerson = tipAmount/amountOfPeopleDouble
        let roundedTipAmountPerPerson = (round(100*tipAmountPerPerson)/100)
        let roundedTipAmountPerPersonString = String(roundedTipAmountPerPerson)
        
        // Share information to the user interface
        tipPerPersonLabel.text = "Tip Per Person: \(roundedTipAmountPerPersonString)$"
        
        

    
}

}
