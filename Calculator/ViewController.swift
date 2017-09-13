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
    
    // all numbers have been assigned to the numbers function. Each button is tagged with a number that is one highe than the actual number on the button (i.e. 1 is tagged as 2)
    @IBAction func numbers(_ sender: UIButton) {
        
        if mathHappening == true
        {
            equation.text = String(sender.tag-1) // the equation label is modified to be whichever number has been selected by the user
            numScreen = Double(equation.text!)! //numScreen is stored as the number that last appeared on the screen
            mathHappening = false
        }
        else
        {
            equation.text = equation.text!
            if sender.tag == 11 {
                equation.text = equation.text!+decimal
            }
            else
            {
                equation.text = equation.text!+String(sender.tag-1)
            }
            numScreen = Double(equation.text!)!
        }
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        if equation.text != "" && sender.tag != 12 && sender.tag != 17
        {
            firstNum = Double(equation.text!)!
            
            if sender.tag == 13
            {
                //division
                equation.text = "/"
                dispOperation = "/"
            }
            else if sender.tag == 14
            {
                //multiplication
                equation.text = "X"
                dispOperation = "X"
            }
            else if sender.tag == 15
            {
                //subtraction
                equation.text = "-"
                dispOperation = "-"
            }
            else if sender.tag == 16
            {
                //addition
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



