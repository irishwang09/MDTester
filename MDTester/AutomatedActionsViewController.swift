//
//  AutomatedActionsViewController.swift
//  MDTester
//
//  Created by Irene Hwang on 8/1/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit
import CoreData

class AutomatedActionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var autoActsTableView: UITableView!
    @IBOutlet weak var autoActionsNavigationItem: UINavigationItem!
    @IBAction func doneButton_Click(sender: AnyObject) {
        performSegueWithIdentifier("goToMCAutoActs", sender: nil)
    }
    @IBAction func doneAdd(segue:UIStoryboardSegue)
    {
        var addViewController = segue.sourceViewController as! AddAutoActsViewController
        /*autoActButtonSeqs.append(addViewController.newButtonSeq)
        autoActNames.append(addViewController.newAutoActName)*/
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity =  NSEntityDescription.entityForName("AutoAction",
            inManagedObjectContext:
            managedContext)
        var newAutoAct = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        var name = addViewController.newAutoActName
        var seq = addViewController.newButtonSeq
        newAutoAct.setValue(addViewController.newAutoActName, forKey: "name")
        if (addViewController.newButtonSeq[0])
        {
            newAutoAct.setValue(true, forKey: "homeButton")
        }
        else
        {
            newAutoAct.setValue(false, forKey: "homeButton")
        }
        if (addViewController.newButtonSeq[1])
        {
            newAutoAct.setValue(true, forKey: "volUpButton")
        }
        else
        {
            newAutoAct.setValue(false, forKey: "volUpButton")
        }
        if (addViewController.newButtonSeq[2])
        {
            newAutoAct.setValue(true, forKey: "volDownButton")
        }
        else
        {
            newAutoAct.setValue(false, forKey: "volDownButton")
        }
        if (addViewController.newButtonSeq[3])
        {
            newAutoAct.setValue(true, forKey: "powerButton")
        }
        else
        {
            newAutoAct.setValue(false, forKey: "powerButton")
        }
        autoActs.append(newAutoAct)
        managedContext.save(nil)
        autoActsTableView.reloadData()
    }
    var autoActs = [NSManagedObject]()
    var autoActButtonSeqs: [[Bool]] = []
    var autoActNames: [String] = []
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoActsTableView.delegate = self
        autoActsTableView.dataSource = self
        self.configureView()
        autoActsTableView.registerNib(UINib(nibName: "AutoActsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"AutoAction")
        var error: NSError?
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        if let results = fetchedResults
        {
            autoActs = results
        }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        autoActsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView()
    {
        if let detail: AnyObject = self.detailItem {
            var title = detailItem
            autoActionsNavigationItem.title = title
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoActs.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
            forIndexPath: indexPath) as! AutoActsTableViewCell
        /*if (autoActButtonSeqs[indexPath.row][0])
        {
            cell.homeImageView.image = UIImage(named: "selectedHomeButton.jpg")
        }
        if (autoActButtonSeqs[indexPath.row][1])
        {
            cell.volUpImageView.image = UIImage(named: "selectedVolUpButton.jpg")
        }
        if (autoActButtonSeqs[indexPath.row][2])
        {
            cell.volDownImageView.image = UIImage(named:"selectedVolDownButton.jpg")
        }
        if (autoActButtonSeqs[indexPath.row][3])
        {
            cell.powerImageView.image = UIImage(named: "selectedPowerButton.jpg")
        }
        cell.nameLabel.text = autoActNames[indexPath.row]*/
        //--------------------------------------------------------
        var autoAct = autoActs[indexPath.row]
        if (autoAct.valueForKey("homeButton") as! Bool)
        {
            cell.homeImageView.image = UIImage(named: "selectedHomeButton.jpg")
        }
        if (autoAct.valueForKey("volUpButton") as! Bool)
        {
            cell.volUpImageView.image = UIImage(named: "selectedVolUpButton.jpg")
        }
        if (autoAct.valueForKey("volDownButton") as! Bool)
        {
            cell.volDownImageView.image = UIImage(named: "selectedVolDownButton.jpg")
        }
        if (autoAct.valueForKey("powerButton") as! Bool)
        {
            cell.powerImageView.image = UIImage(named: "selectedPowerButton.jpg")
        }
        cell.nameLabel.text = autoAct.valueForKey("name") as! String
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
