//
//  ConversionViewController.swift
//  OrbTrekker1
//
//  Created by Anand Chaudhary on 11/14/22.
//

import UIKit
    // outlet is like an output in ios world
class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet{
            print(#function)
            updateCelsiusLabel()
        }
    }
    
    //computed property
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
    func updateCelsiusLabel(){
        print(#function)
        if let value = celsiusValue{
            celsiusLabel.text = String(format: "%.2f", value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        print(#function)
        textField.resignFirstResponder() // first view that is going to respond to the events
    }
    
    @IBAction func farenheitFieldEditingChanged(textField: UITextField){
        print(#function)
        if let text = textField.text, let value = Double(text){ // , (comma means and)
            fahrenheitValue = value
        }else{
            fahrenheitValue = nil
        }
       
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalPoint = textField.text?.range(of: ".")
        let replacementTextHasDecimalPoint = string.range(of: ".")
        
        return existingTextHasDecimalPoint == nil ||
            replacementTextHasDecimalPoint  == nil
    }
    
}


