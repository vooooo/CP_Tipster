//
//  ViewController2.swift
//  tips
//
//  Created by vu on 8/24/15.
//  Copyright (c) 2015 vu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var defTipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let tipsIsNotNill = defaults.objectForKey("tipPercentage") as? Int {
            self.defTipControl.selectedSegmentIndex = defaults.objectForKey("tipPercentage") as! Int
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipChanged(sender: AnyObject) {
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.defTipControl.selectedSegmentIndex, forKey: "tipPercentage")
        
        println(self.defTipControl.selectedSegmentIndex)
        
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
