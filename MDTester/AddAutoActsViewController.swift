//
//  AddAutoActsViewController.swift
//  MDTester
//
//  Created by Irene Hwang on 8/4/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit

class AddAutoActsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    //Properties------------------------------------
    
    @IBOutlet weak var autoActsPickerView: UIPickerView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var volUpButton: UIButton!
    @IBOutlet weak var volDownButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    var database = [[Bool]]()
    var autoActsNames = ["Send default message to friends and family", "Call guardian", "Sound alarm", "Call the police", "Alert others to crime"]
    var newAutoActName = ""
    var newButtonSeq: [Bool] = []
    
    //Default methods---------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeButton.setImage(UIImage(named: "unselectedHomeButton.jpg"), forState: .Normal)
        volUpButton.setImage(UIImage(named: "unselectedVolUpButton.jpg"), forState: .Normal)
        volDownButton.setImage(UIImage(named: "unselectedVolDownButton.jpg"), forState: .Normal)
        powerButton.setImage(UIImage(named: "unselectedPowerButton.jpg"), forState: .Normal)
        errorMessageLabel.textColor = UIColor.whiteColor()
        navigationItem.title = "Add a New Automated Action"
        autoActsPickerView.delegate = self
        autoActsPickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return autoActsNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return autoActsNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newAutoActName = autoActsNames[row]
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if (identifier == "doneSegue")
        {
            var seq = [Bool]()
            if (homeButton.imageView?.image == UIImage(named: "selectedHomeButton.jpg"))
            {
                seq.append(true)
            }
            else
            {
                seq.append(false)
            }
            if (volUpButton.imageView?.image == UIImage(named: "selectedVolUpButton.jpg"))
            {
                seq.append(true)
            }
            else
            {
                seq.append(false)
            }
            if (volDownButton.imageView?.image == UIImage(named: "selectedVolDownButton.jpg"))
            {
                seq.append(true)
            }
            else
            {
                seq.append(false)
            }
            if (powerButton.imageView?.image == UIImage(named: "selectedPowerButton.jpg"))
            {
                seq.append(true)
            }
            else
            {
                seq.append(false)
            }
            newButtonSeq = seq
            var buttonCount: Int = 0
            for button in newButtonSeq
            {
                if (button)
                {
                    buttonCount++
                }
            }
            /*if (buttonCount <= 1)
            {
                errorMessageLabel.textColor = UIColor.redColor()
                return false
            }*/
        }
        return true
    }
    //Button Actions--------------------------------
    
    @IBAction func doneButton_Click(sender: AnyObject?) {
        
    }
    @IBAction func homeButton_Click(sender: AnyObject)
    {
        if (homeButton.imageView?.image == UIImage(named: "unselectedHomeButton.jpg"))
        {
            homeButton.setImage(UIImage(named: "selectedHomeButton.jpg"), forState: .Normal)
        }
        else
        {
            homeButton.setImage(UIImage(named: "unselectedHomeButton.jpg"), forState: .Normal)
        }
    }

    @IBAction func volUpButton_Click(sender: AnyObject) {
        if (volUpButton.imageView?.image == UIImage(named: "unselectedVolUpButton.jpg"))
        {
            volUpButton.setImage(UIImage(named: "selectedVolUpButton.jpg"), forState: .Normal)
        }
        else
        {
            volUpButton.setImage(UIImage(named: "unselectedVolUpButton.jpg"), forState: .Normal)
        }
    }
    
    @IBAction func volDownButton_Click(sender: AnyObject) {
        if (volDownButton.imageView?.image == UIImage(named: "unselectedVolDownButton.jpg"))
        {
            volDownButton.setImage(UIImage(named: "selectedVolDownButton.jpg"), forState: .Normal)
        }
        else
        {
            volDownButton.setImage(UIImage(named: "unselectedVolDownButton.jpg"), forState: .Normal)
        }
    }
    
    @IBAction func powerButton_Click(sender: AnyObject) {
        if (powerButton.imageView?.image == UIImage(named: "unselectedPowerButton.jpg"))
        {
            powerButton.setImage(UIImage(named: "selectedPowerButton.jpg"), forState: .Normal)
        }
        else
        {
            powerButton.setImage(UIImage(named: "unselectedPowerButton.jpg"), forState: .Normal)
        }
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
