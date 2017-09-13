//
//  ViewController.swift
//  Calculator
//
//  Created by Allison Marley on 9/12/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numScreen:Double = 0; //the current number that is on the screen
    var firstNum:Double=0; //the first number that was entered into the calculator
    var mathHappening = false //whether or not a math operation is occuring
    var operation = 0; // used to determine which operation button has been selected
    var dispOperation:String = "/" // a string used to display what operation has been selected for later use in the equation label
    var decimal:String = "." // a string used to display a decimal
    var negative:String = "-" // a string used for placing a negative sign in front of the number
    
    
    @IBOutlet weak var equation: UILabel! // creates the equation label
    @IBOutlet weak var result: UILabel! // creates the result label
    
    // if the sign change button has been selected (+/-) by the user, place a negative sign in the equation label
    @IBAction func signchange(_ sender: UIButton) {
        equation.text = negative
    }
    
    // all numbers have been assigned to the numbers function. Each button is tagged with a number that is one higher than the actual number on the button (i.e. 1 is tagged as 2)
    @IBAction func numbers(_ sender: UIButton) {
        
        if mathHappening == true //if an operation has been selected
        {
            equation.text = String(sender.tag-1) // the equation label is modified to be whichever number has been selected by the user
            numScreen = Double(equation.text!)! //numScreen is stored as the number that last appeared on the screen
            mathHappening = false
        }
        else //an operation has not been selected
        {
            equation.text = equation.text!
            // if decimal button is selected add a decimal to the string in the equation label
            if sender.tag == 11 {
                equation.text = equation.text!+decimal
            }
            else //no decimal was selected proceed with the equation
            {
                equation.text = equation.text!+String(sender.tag-1)
            }
            numScreen = Double(equation.text!)! //the last number to appear on the screen store in the variable numScreen
        }
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        if equation.text != "" && sender.tag != 12 && sender.tag != 17
        {
            firstNum = Double(equation.text!)! //store what is on the equation label as the first number in the calculation
            
            if sender.tag == 13
            {
                //displays division sign in equation label and stores division sign as a string in dispOperation
                equation.text = "/"
                dispOperation = "/"
            }
            else if sender.tag == 14
            {
                //displays multiplication sign in equation label and stores multiplication sign as a string in dispOperation
                equation.text = "X"
                dispOperation = "X"
            }
            else if sender.tag == 15
            {
                //displays subtraction sign in equation label and stores subtraction sign as a string in dispOperationsubtraction
                equation.text = "-"
                dispOperation = "-"
            }
            else if sender.tag == 16
            {
                //displays addition sign in equation label and stores addition sign as a string in dispOperation
                equation.text = "+"
                dispOperation = "+"
            }
            
            operation = sender.tag;
            mathHappening = true;
            equation.text = String(numScreen)
        }
            
       //user has clicked equal sign
       else if  sender.tag == 17 {
           if operation == 13
           {
               //perform division
                result.text = String(firstNum / numScreen)
            }
            if operation == 14
            {
                //perform multiplication
                result.text = String(firstNum * numScreen)
            }
            if operation == 15
            {
                //perform subtraction
                result.text = String(firstNum - numScreen)
            }
            if operation == 16
            {
                //perform addition
                result.text = String(firstNum + numScreen)
            }
            
            equation.text = String(firstNum)+"  "+dispOperation+"  "+String(numScreen)
        }
        
        else if sender.tag == 12
        {
            equation.text = ""
            result.text = ""
            firstNum = 0;
            numScreen = 0;
            operation = 0;
        }
        
        
        }

    }



