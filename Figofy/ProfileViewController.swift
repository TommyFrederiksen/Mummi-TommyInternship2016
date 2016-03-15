//
//  ProfileViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

import Firebase


class ProfileViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var user: FigofyUser!
    var fishInit: Fish!
    var fish = [Fish]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.clipsToBounds = true
        feedTableView.delegate = self
        feedTableView.dataSource = self
        observerForFeed()
        
        
        
        
    }
    
    
    func observerForFeed()
    {
        DataService.dataService.REF_FISH.observeEventType(.Value, withBlock:
            { snapshot in
                
                
                self.fish = []
                if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]
                {
                    for element in snapshots
                    {
                        
                        if let fishDict = element.value as? Dictionary<String, AnyObject>
                        {
                            let key = element.key
                            let _fish = Fish(postKey: key, dictionary: fishDict)
                            self.fish.append(_fish)
                            
                        }
                    }
                }
                
        })
        feedTableView.reloadData()
    }
 
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fish.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "FeedCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? logCell
        
        cell?.configureCell(fish[indexPath.row])
        
        print(fish.count)
        
        
        return cell!
    }
}