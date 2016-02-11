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
    
    // MARK: TableView Methods
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let sea: Sea!
        
        sea = seas[indexPath.row]
        
        performSegueWithIdentifier("LakeInformationVC", sender: sea)
    }
    
    
    func createSea() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Sea", inManagedObjectContext: context)!
        //new recipe class
        let sea = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea.name = ""
        sea.address = ""
        sea.zipCode = ""
        sea.city = ""
        
        let sea2 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea2.name = ""
        sea2.address = ""
        sea2.zipCode = ""
        sea2.city = ""
        
        let sea3 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea3.name = ""
        sea3.address = ""
        sea3.zipCode = ""
        sea3.city = ""
        
        let sea4 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea4.name = ""
        sea4.address = ""
        sea4.zipCode = ""
        sea4.city = ""
        
        let sea5 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea5.name = ""
        sea5.address = ""
        sea5.zipCode = ""
        sea5.city = ""
        
        let sea6 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea6.name = ""
        sea6.address = ""
        sea6.zipCode = ""
        sea6.city = ""
        
        let sea7 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea7.name = ""
        sea7.address = ""
        sea7.zipCode = ""
        sea7.city = ""
        
        let sea8 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea8.name = ""
        sea8.address = ""
        sea8.zipCode = ""
        sea8.city = ""
        
        let sea9 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea9.name = ""
        sea9.address = ""
        sea9.zipCode = ""
        sea9.city = ""
        
        let sea10 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea10.name = ""
        sea10.address = ""
        sea10.zipCode = ""
        sea10.city = ""
        
        let sea11 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea11.name = ""
        sea11.address = ""
        sea11.zipCode = ""
        sea11.city = ""
        
        let sea12 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea12.name = ""
        sea12.address = ""
        sea12.zipCode = ""
        sea12.city = ""
        
        let sea13 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea13.name = ""
        sea13.address = ""
        sea13.zipCode = ""
        sea13.city = ""
        
        let sea14 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea14.name = ""
        sea14.address = ""
        sea14.zipCode = ""
        sea14.city = ""
        
        let sea15 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea15.name = ""
        sea15.address = ""
        sea15.zipCode = ""
        sea15.city = ""
        
        let sea16 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea16.name = ""
        sea16.address = ""
        sea16.zipCode = ""
        sea16.city = ""
        
        let sea17 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea17.name = ""
        sea17.address = ""
        sea17.zipCode = ""
        sea17.city = ""
        
        let sea18 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea18.name = ""
        sea18.address = ""
        sea18.zipCode = ""
        sea18.city = ""
        
        let sea19 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea19.name = ""
        sea19.address = ""
        sea19.zipCode = ""
        sea19.city = ""
        
        let sea20 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea20.name = ""
        sea20.address = ""
        sea20.zipCode = ""
        sea20.city = ""
        
        let sea21 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea21.name = ""
        sea21.address = ""
        sea21.zipCode = ""
        sea21.city = ""
        
        let sea22 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea22.name = ""
        sea22.address = ""
        sea22.zipCode = ""
        sea22.city = ""
        
        let sea23 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea23.name = ""
        sea23.address = ""
        sea23.zipCode = ""
        sea23.city = ""
        
        let sea24 = Sea(entity: entity, insertIntoManagedObjectContext: context)
        sea24.name = ""
        sea24.address = ""
        sea24.zipCode = ""
        sea24.city = ""
        
        context.insertObject(sea)
        
        do {
            try context.save()
        } catch  {
            print("could not save recipe")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LakeInformationVC" {
            if let lakeInfo = segue.destinationViewController as? LakeInformationVC {
                if let sea = sender as? Sea {
                    lakeInfo.sea = sea
                }
            }
        }
    }

}
