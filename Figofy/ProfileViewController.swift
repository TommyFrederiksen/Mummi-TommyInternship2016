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
    
    var logImages = ["log1","log2","log3","log4","log5"]
    var agnLbls = ["Wobler","Gennemløber blå/grøn","Majs","Kobber spinner","Blink"]
    var artLbls = ["Gedde","Ørred","Skalle","ukendt","Ørred?"]
    var beskrivelsesLbls = ["Bagsværd sø","Simone Put & Take","Holbæk havn","Gudenåen", "Køgebugt syd"]
    var metodeLbls = ["Spinne","Spinne","Mede","Spinne","Spinne"]
    var længdeLbls = ["87cm","39cm","17cm","23cm","74cm"]
    var vægtLbls = ["7,2kg","1,8kg","0,1kg","0,2kg","5,1kg"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.clipsToBounds = true
        feedTableView.delegate = self
        feedTableView.dataSource = self
        nameLbl.text = LoggedInUser.CurrentLoggedInUser()._firstName
        
        let ref = DataService.dataService.REF_FISH
        ref.observeSingleEventOfType(.Value, withBlock:
            { snapshot in
                if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]
                {
                    for snap in snapshots
                    {
                        
                        
                        if let FishDictionary = snap.value as? Dictionary<String, AnyObject>{
                        let key = snap.key
                            
                        }
                    }
                }
        })
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return logImages.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "FeedCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? logCell
        let img = UIImage(named: logImages[indexPath.row])
        
        cell?.configureCell(img!, agn: agnLbls[indexPath.row], art: artLbls[indexPath.row], beskrivelse: beskrivelsesLbls[indexPath.row], metode: metodeLbls[indexPath.row], længde: længdeLbls[indexPath.row], vægt: vægtLbls[indexPath.row])
        
        
        
        return cell!
    }
    
    
    
    
    
    
    
    
    
    
}