//
//  ProfileViewController.swift
//  MDTester
//
//  Created by Irene Hwang on 8/1/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileNavigationItem: UINavigationItem!
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    //UI Elements
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileMobileNumLabel: UILabel!
    @IBOutlet weak var profileEditNameLabel: UITextField!
    @IBOutlet weak var profileEditMobileNumLabel: UITextField!
    @IBOutlet weak var profileEditAddButton: UIButton!
    @IBOutlet weak var profileEditAddMNNameTextField: UITextField!
    @IBOutlet weak var profileEditAddMobileNumTextField: UITextField!
    @IBOutlet weak var profileEditAddMNNameLabel: UILabel!
    @IBOutlet weak var profileEditAddMobileNumLabel: UILabel!
    
    var editModeOn = false
    //var user = NSManagedObject()
    
    //Button methods
    @IBAction func doneButton_Click(sender: AnyObject) {
        if (editModeOn)
        {
            profileNameLabel.text = profileEditNameLabel.text
            profileNameLabel.hidden = false
            profileEditNameLabel.hidden = true
            profileMobileNumLabel.text = profileEditMobileNumLabel.text
            profileMobileNumLabel.hidden = false
            profileEditMobileNumLabel.hidden = true
            profileEditAddButton.hidden = true
            profileEditAddMNNameLabel.text = profileEditAddMNNameTextField.text
            profileEditAddMobileNumLabel.text = profileEditAddMobileNumTextField.text
            profileEditAddMNNameTextField.hidden = true
            profileEditAddMobileNumTextField.hidden = true
            profileEditAddMNNameLabel.hidden = false
            profileEditAddMobileNumLabel.hidden = false
            editModeOn = false
            /*
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
            let entity =  NSEntityDescription.entityForName("User",
                inManagedObjectContext:
                managedContext)
            user.setValue(profileEditNameLabel.text, forKey: "name")
            user.setValue(profileEditMobileNumLabel.text, forKey: "mobileNumber")
            var fetchRequest = NSFetchRequest(entityName: "User")
            if let fetchResults = appDelegate.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? NSManagedObject
            {
                    var managedObject = fetchResults
                    managedObject.setValue(profileEditMobileNumLabel.text, forKey: "mobileNumber")
                    managedObject.setValue(profileEditNameLabel.text, forKey: "name")
                    managedContext.save(nil)
            }*/
        }
        else
        {
            performSegueWithIdentifier("goToMCProfile", sender: nil)
        }
    }
    
    @IBAction func editButton_Click(sender: AnyObject) {
        profileNameLabel.hidden = true
        profileMobileNumLabel.hidden = true
        profileEditNameLabel.hidden = false
        profileEditMobileNumLabel.hidden = false
        profileEditAddButton.hidden = false
        editModeOn = true
        profileEditNameLabel.text = profileNameLabel.text
        profileEditMobileNumLabel.text = profileMobileNumLabel.text
    }
    
    @IBAction func profileEditAddButton_Click(sender: AnyObject) {
        profileEditAddMNNameTextField.hidden = false
        profileEditAddMobileNumTextField.hidden = false
    }
    
    //Default methods----------------------------------------
    override func viewDidLoad() {
        profileEditNameLabel.hidden = true
        profileEditMobileNumLabel.hidden = true
        profileEditAddButton.hidden = true
        profileEditAddMobileNumTextField.hidden = true
        profileEditAddMobileNumLabel.hidden = true
        profileEditAddMNNameTextField.hidden = true
        profileEditAddMNNameLabel.hidden = true
        
        super.viewDidLoad()

        /*let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity =  NSEntityDescription.entityForName("User",
            inManagedObjectContext:
            managedContext)
        let newUser = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        newUser.setValue("Iris Hwang", forKey: "name")
        newUser.setValue("1234567890", forKey: "mobileNumber")
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        let fetchRequest = NSFetchRequest(entityName:"User")
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? NSManagedObject
        if let results = fetchedResults
        {
            user = results
        }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        self.configureView()*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView()
    {
        if let detail: AnyObject = self.detailItem {
            var title = detailItem as! String
            profileNavigationItem.title = title
        }
        /*if let userName = user.valueForKey("name") as? String
        {
            profileNameLabel.text = userName
        }
        if let userMN = user.valueForKey("mobileNumber") as? String
        {
            profileMobileNumLabel.text = userMN
        }*/
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
