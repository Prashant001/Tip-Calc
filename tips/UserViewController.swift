//
//  UserViewController.swift
//  tips
//
//  Created by Prashant Bhartiya on 8/20/14.
//  Copyright (c) 2014 Prashant Bhartiya. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UIPickerViewDelegate{

    var tipPercent = ["18","20","22"]
    
    
    @IBOutlet weak var percentPicker: UIPickerView!
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        
        return 1;
        
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        
        return tipPercent.count
    }

    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String{
        
        return tipPercent[row]
    }

    @IBAction func onClickBackButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion:nil)
    }

    

    @IBAction func onClickCancel(sender: AnyObject) {
        selectDefaultTipPercent()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        selectDefaultTipPercent()
        
    }
    func selectDefaultTipPercent (){
            
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercent = defaults.objectForKey("tip_percent")
        if tipPercent != nil{
            
            percentPicker.selectRow(tipPercent as Int, inComponent: 0, animated: true)
        }

            
    }
        
        
    

    
    @IBAction func onClickApply(sender: AnyObject) {
        
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        
        defaults.setObject(percentPicker.selectedRowInComponent(0), forKey: "tip_percent")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
