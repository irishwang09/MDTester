//
//  ButtonSequencesViewController.swift
//  MDTester
//
//  Created by Irene Hwang on 8/1/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

import UIKit

class ButtonSequencesViewController: UIViewController {

    @IBOutlet weak var buttonSeqsNavigationItem: UINavigationController!
    
    @IBAction func doneButton_Click(sender: AnyObject) {
        performSegueWithIdentifier("goToMCButtonSeqs", sender: nil)
    }
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView()
    {
        if let detail: AnyObject = self.detailItem {
            var title = detailItem as! String
            buttonSeqsNavigationItem.title = title
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
