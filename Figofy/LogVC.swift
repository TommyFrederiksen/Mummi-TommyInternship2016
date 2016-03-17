//
//  LogVC.swift
//  Figofy
//
//  Created by Tommy on 08/03/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class LogVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var logTableView: UITableView!
    var user: FigofyUser!
    var catches = [String]()
    var fish = [Fish]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logTableView.delegate = self
        logTableView.dataSource = self
        observerForLog()
        print(fish.count)
    }
    
    func observerForLog()
    {
        self.fish = []
        
        DataService.dataService.REF_USER_CURRENT.childByAppendingPath("fish").observeEventType(.ChildAdded, withBlock: { fishIds in
            
            print("\(fishIds.key)")
            DataService.dataService.REF_FISH.childByAppendingPath(fishIds.key).observeEventType(.Value, withBlock: {
                fishSnaps in
                if let snapshots = fishSnaps.children.allObjects as? [FDataSnapshot] {
                    for currentFish in snapshots {
                        if let fish = currentFish.value as? Dictionary<String, AnyObject> {
                            let key = currentFish.key
                            let personalFish = Fish(postKey: key, dictionary: fish)
                            self.fish.append(personalFish)
                        }
                    }
                }
                
            })
            self.logTableView.reloadData()
        })
    }



func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // MARK: return the number of rows
    return fish.count
}
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "logCell"
    if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? logCell {
        
        let fish = self.fish[indexPath.row]
        
        cell.configureCell(fish)
        
        return cell
        
    } else {
        return UITableViewCell()
    }
    
}

@IBAction func BackToProfile(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
    
}





}
