//
//  ContactDetailsViewController.swift
//  MDTester
//
//  Created by Irene Hwang on 8/3/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var cdNavigationItem: UINavigationItem!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mnTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var statusPickerView: UIPickerView!
    
    var mode: Int = 0
    var edittedStatus: String = ""
    
    var statusOptions = ["Guardian", "Contact"]
    var pageTitle: String? = ""
    var originalName: String = ""
    var originalMN: String = ""
    var originalAddress: String = ""
    var originalStatus: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureView()
        statusPickerView.dataSource = self
        statusPickerView.delegate = self
    }
    
    func configureView()
    {
        if mode >= 0 //edit mode on
        {
            cdNavigationItem.title = self.pageTitle
            nameTextField.text = originalName
            mnTextField.text = originalMN
            addressTextField.text = originalAddress
            if (originalStatus == "Guardian")
            {
                statusPickerView.selectRow(0, inComponent: 0, animated: false)
            }
            else
            {
                statusPickerView.selectRow(1, inComponent: 0, animated: false)
            }
        }
        else //add mode on
        {
            mode = -1
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }

    //Picker View Data Source methods ==================================
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return statusOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        edittedStatus = statusOptions[row]
    }

}
