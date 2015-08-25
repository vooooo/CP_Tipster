//
//  ViewController.swift
//  tips
//
//  Created by vu on 8/24/15.
//  Copyright (c) 2015 vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.billField.becomeFirstResponder();
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let tipsIsNotNill = defaults.objectForKey("tipPercentage") as? Int {
            self.tipControl.selectedSegmentIndex = defaults.objectForKey("tipPercentage") as! Int
            
            println(self.tipControl.selectedSegmentIndex)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        
        let calendar = NSCalendar.currentCalendar()
        
        defaults.setObject(self.tipLabel.text, forKey: "tipLabel")
        defaults.setObject(self.totalLabel.text forKey: "totalLabel")
        defaults.setObject(self.tipControl.selectedSegmentIndex, forKey: "percentage")
        defaults.setObject(calendar forKey: "totalLabel")
        

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

