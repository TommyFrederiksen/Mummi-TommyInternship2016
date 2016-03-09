//
//  LogVC.swift
//  Figofy
//
//  Created by Tommy on 08/03/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation
import UIKit


class LogVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var logTableView: UITableView!
   
    
    var logImages = ["EventImage1"]
    var agnLbls = ["Madding"]
    var artLbls = ["Laks"]
    var beskrivelsesLbls = ["Fangede en Fisk"]
    var metodeLbls = ["Med Stang"]
    var længdeLbls = ["1,2 M"]
    var vægtLbls = ["4,5 Kg"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logTableView.delegate = self
        logTableView.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // MARK: return the number of rows
        return logImages.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "logCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? logCell
        let img = UIImage(named: logImages[indexPath.row])
        
       cell?.configureCell(img!, agn: agnLbls[indexPath.row], art: artLbls[indexPath.row], beskrivelse: beskrivelsesLbls[indexPath.row], metode: metodeLbls[indexPath.row], længde: længdeLbls[indexPath.row], vægt: vægtLbls[indexPath.row])
    
        
        
        
        
        
        return cell!
    }
    
    



}
