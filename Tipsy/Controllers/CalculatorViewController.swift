//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipString = "10%"
    var tipValueDecimal: Double = 0.1
    var numberOfPeople: Double = 1.0
    var result: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
    }
    
    
 
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tipString = sender.currentTitle!
        
        //eliminate % sign from the tip button title
        let tipValueString = tipString.replacingOccurrences(of: "%", with: "")
        
        //change tip type from string to Double
        tipValueDecimal = Double(tipValueString)! / 100
        
    }
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfPeople)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        result = 0.0
        if billTextField.text == "" {
            billTextField.placeholder = "Enter a Number."
        }else{
            //Change the textField text to a double number and calculate the result
            if let number = Double(billTextField.text!) {
                result = (number + (number * tipValueDecimal)) / numberOfPeople
            }
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            if let resultsVC = segue.destination as? ResultsViewController {
                resultsVC.tip = tipString
                resultsVC.split = Int(numberOfPeople)
                resultsVC.result = String(format: "%.2f", result)
            }
        }
    }
    
   
    //Add tap gesture recognizaer to the main view for resigning textField
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resigntextField))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func resigntextField(){
        billTextField.resignFirstResponder()
    }
    
}

