//
//  EventTableVC.swift
//  Figofy
//
//  Created by Tommy on 04/02/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class EventTableVC: UITableViewController {

    // MARK: Properties
    
    var events = [Event]()
    
        
    func loadSampleEvents()
    {
        let photo1 = UIImage(named: "EventImage1")!
        let photo2 = UIImage(named: "EventImage2")!
        let photo3 = UIImage(named: "EventImage3")!
        
        //let event1 = Event(name: "Fiske Konkurance!!!", description: "Første premie = 5.000DKK", dateTime: "marts 01, 2016")
        let event1 = Event(name: "Fiske Konkurance!!!", description: "Første premie = 5.000DKK", dateTime: "marts 01, 2016",photo: photo1)
        let event2 = Event(name: "Dagen Største Fisk!!", description: "Første premie = 1 Måned Fri Fiskeri i Søen", dateTime: "marts 03, 2016",photo: photo2)
        let event3 = Event(name: "Fiske Marathon :)", description: "fisk i 12 timer betal kun for 5 timer", dateTime: "marts 07, 2016",photo: photo3)
        
        
        events += [event1]
        events += [event2]
        events += [event3]
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleEvents()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // MARK: return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // MARK: return the number of rows
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EventTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        let event = events[indexPath.row]
        // MARK:configures the cell
        cell.photoImageView.image = event._photo
        cell.nameLabel.text = event._name
        cell.descriptionLabel.text = event._description
        cell.timeAndDateLabel.text = event._dateTime
        

        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}