//
//  DetailViewController.swift
//  MDTester
//
//  Created by Irene Hwang on 8/1/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var detailNavigationItem: UINavigationItem?
    @IBOutlet weak var contactsListTableView: UITableView!
    //GUI Elements
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var profileViewCont: ProfileViewController!
    
    var contacts = [NSManagedObject]()
    var names: [String] = ["Iris", "Isabelle", "Irene", "Isaac"]
    var mns: [Int] = [4253728898, 2533340210, 4253728880, 1234567890]
    var addresses: [String] = ["100 1th St /r Seattle, WA", "100 1th St /r Seattle, WA", "100 1th St /r Seattle, WA", "100 1th St /r Seattle, WA"]
    var statuses: [String] = ["Guardian", "Guardian", "Guardian", "Contact"]
    var currentIndexPath: NSIndexPath!
    
    //====================================================================================
    
    @IBAction func doneButton_Click(sender: AnyObject) {
        performSegueWithIdentifier("goToMCContacts", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "goToCDContactsEdit")
        {
            var destViewController = segue.destinationViewController as! ContactDetailsViewController
            /*destViewController.mode = currentIndexPath.row
            destViewController.pageTitle = names[currentIndexPath.row]
            destViewController.originalName =  names[currentIndexPath.row]
            destViewController.originalMN = mns[currentIndexPath.row]
            destViewController.originalAddress = addresses[currentIndexPath.row]
            destViewController.originalStatus = statuses[currentIndexPath.row]*/
            destViewController.mode = currentIndexPath.row
            destViewController.originalName = contacts[currentIndexPath.row].valueForKey("name") as! String
            destViewController.originalAddress = contacts[currentIndexPath.row].valueForKey("address") as! String
            destViewController.originalStatus = contacts[currentIndexPath.row].valueForKey("status") as! String
            destViewController.originalMN = contacts[currentIndexPath.row].valueForKey("mobileNumber") as! String
        }
        else if (segue.identifier == "goToCDContactsAdd")
        {
            var destViewController = segue.destinationViewController as! ContactDetailsViewController
            destViewController.mode = -1
        }
    }
    
    @IBAction func doneContact(segue: UIStoryboardSegue)
    {
        var cdViewController = segue.sourceViewController as! ContactDetailsViewController
        if (cdViewController.mode >= 0) //edit mode
        {
            /*var index = cdViewController.mode
            names[index] = cdViewController.nameTextField.text
            mns[index] = cdViewController.mnTextField.text.toInt()!
            addresses[index] = cdViewController.addressTextField.text
            statuses[index] = cdViewController.edittedStatus
            
            contactsListTableView.reloadData()*/
            //
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
            let entity =  NSEntityDescription.entityForName("Contact",
                inManagedObjectContext:
                managedContext)
            var edittedContact = contacts[cdViewController.mode]
            edittedContact.setValue(cdViewController.nameTextField.text, forKey: "name")
            edittedContact.setValue(cdViewController.mnTextField.text, forKey: "mobileNumber")
            edittedContact.setValue(cdViewController.addressTextField.text, forKey: "address")
            edittedContact.setValue(cdViewController.edittedStatus, forKey: "status")
            var fetchRequest = NSFetchRequest(entityName: "Contact")
            if let fetchResults = appDelegate.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject]
            {
                if fetchResults.count != 0
                {
                    var managedObject = fetchResults[cdViewController.mode]
                    managedObject.setValue(cdViewController.nameTextField.text, forKey: "name")
                    managedObject.setValue(cdViewController.mnTextField.text, forKey: "mobileNumber")
                    managedObject.setValue(cdViewController.addressTextField.text, forKey: "address")
                    managedObject.setValue(cdViewController.edittedStatus, forKey: "status")
                    managedContext.save(nil)
                }
            }
            contactsListTableView.reloadData()
        }
        else //add mode
        {
            /*names.append(cdViewController.nameTextField.text)
            mns.append(cdViewController.mnTextField.text.toInt()!)
            addresses.append(cdViewController.addressTextField.text)
            statuses.append(cdViewController.edittedStatus)
            contactsListTableView.reloadData()*/
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
            let entity =  NSEntityDescription.entityForName("Contact",
                inManagedObjectContext:
                managedContext)
            let newContact = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext:managedContext)
            newContact.setValue(cdViewController.nameTextField.text, forKey: "name")
            newContact.setValue(cdViewController.mnTextField.text, forKey: "mobileNumber")
            newContact.setValue(cdViewController.addressTextField.text, forKey: "address")
            newContact.setValue(cdViewController.edittedStatus, forKey: "status")
            contacts.append(newContact)
            var error: NSError?
            if !managedContext.save(&error) {
                println("Could not save \(error), \(error?.userInfo)")
            }
            contactsListTableView.reloadData()
        }
    }
    //====================================================================================
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return names.count
        return contacts.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
            forIndexPath: indexPath) as! contactCell

        //cell.cellNameLabel.text = names[indexPath.row]
        var contact = contacts[indexPath.row]
        cell.cellNameLabel.text = contact.valueForKey("name") as! String
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentIndexPath = indexPath
        performSegueWithIdentifier("goToCDContactsEdit", sender: nil)
    }
    //Default Methods
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        if let detail: AnyObject = self.detailItem {
            var title = detailItem
            detailNavigationItem!.title = title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contactsListTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        contactsListTableView.registerNib(UINib(nibName: "contactCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"Contact")
        var error: NSError?
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        if let results = fetchedResults
        {
            contacts = results
        }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

