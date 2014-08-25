//
//  ViewController.swift
//  tips
//
//  Created by Prashant Bhartiya on 8/20/14.
//  Copyright (c) 2014 Prashant Bhartiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
                            
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var formatter:NSNumberFormatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale() // This is the default
        formatter.maximumIntegerDigits = 20
        var billAmount = defaults.objectForKey("bill_amount")
        if billAmount != nil{
            billField.text = billAmount as String
             //billField.text = formatter.stringForObjectValue(billAmount as String)
        }
   
        var tipPercent = defaults.objectForKey("tip_percent")
        if tipPercent != nil{
            
            tipControl.selectedSegmentIndex = tipPercent as Int
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
    
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
     
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
    
        view.endEditing(true)
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercent = defaults.objectForKey("tip_percent")
        if tipPercent != nil{
            
            tipControl.selectedSegmentIndex = tipPercent as Int
        }

        
    }
    
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billField.text, forKey: "bill_amount")
        defaults.synchronize()
    }

}

