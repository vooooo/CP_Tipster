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

        // Set focus on billField, pulls up num keypad
        self.billField.becomeFirstResponder();
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        // Get lastsaved date and compare to current date
        let lastsaved = defaults.objectForKey("lastsaved") as! NSDate!
        let currentdate = NSDate()
        let cal = NSCalendar.currentCalendar()
        let components = cal.components(.CalendarUnitMinute, fromDate: lastsaved, toDate: currentdate, options: nil)

        // If last saved is less than 10 minutes, restore values
        if components.minute < 10 {
            
            self.totalLabel.text = defaults.objectForKey("totalLabel") as? String
            self.tipLabel.text = defaults.objectForKey("tipLabel") as? String
            self.tipControl.selectedSegmentIndex = defaults.objectForKey("percentage") as! Int
        } else {
            
            // Set tip percentage defaults
            self.tipControl.selectedSegmentIndex = defaults.objectForKey("tipPercentage") as! Int
        }
        self.view.backgroundColor = UIColor.orangeColor()

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
        
        
        // Store all changes in user defaults
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.tipLabel.text, forKey: "tipLabel")
        defaults.setObject(self.totalLabel.text, forKey: "totalLabel")
        defaults.setObject(self.tipControl.selectedSegmentIndex, forKey: "percentage")
        defaults.setObject(NSDate(), forKey:"lastsaved")
        

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

