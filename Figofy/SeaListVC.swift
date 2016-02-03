//
//  SeaListVC.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 02/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit
import CoreData

class SeaListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var seas = [Sea]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //move to custom class
//        tableView.layer.cornerRadius = 10
//        tableView.layer.borderColor = UIColor.blackColor().CGColor
//        tableView.layer.borderWidth = 0.25
//        tableView.layer.shadowColor = UIColor.blackColor().CGColor
//        tableView.layer.shadowOpacity = 0.6
//        tableView.layer.shadowRadius = 15
//        tableView.layer.shadowOffset = CGSize(width: 5, height: 5)
//        tableView.layer.masksToBounds = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        fetchAndSetResults()
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func fetchAndSetResults () {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Sea")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.seas = results as! [Sea]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("SeaCell") as? SeaCell {
            let sea = seas[indexPath.row]
            cell.configureCell(sea)
            return cell
        } else {
            return SeaCell()
        }
        
    }
    
    func createSea() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Sea", inManagedObjectContext: context)!
        //new recipe class
        let sea = Sea(entity: entity, insertIntoManagedObjectContext: context)
        
        sea.name = "Mummi"
        sea.address = "A gradient lake of beautiful colors on vale avenue"
        
        context.insertObject(sea)
        
        do {
            try context.save()
        } catch  {
            print("could not save recipe")
        }
    }

}
