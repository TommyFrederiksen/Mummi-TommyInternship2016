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
    var logImages = ["log1","log2","log3","log4","log5"]
    var agnLbls = ["Powerbait Gul","Saltede sandorm","Gummiagn","Powerbait Blå","ingen"]
    var artLbls = ["Laks","GuldLaks","Torsk","Hvilling","Lange"]
    var beskrivelsesLbls = ["Fangede en Fisk","Sygeste fangst :D","Min stolthed","Se hvad jeg fik på krogen", "Fik den med hjem"]
    var metodeLbls = ["Agnfiskeri","Geddefiskeri","Spinnefiskeri","Fluefiskeri","Jigfiskeri"]
    var længdeLbls = ["1,2 M","1,4 M","2,1 M","0.3 M","0,8 M"]
    var vægtLbls = ["4,5 Kg","1,9 Kg","2,7 Kg","1,5 Kg","4,1 Kg"]
    
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
    
    @IBAction func BackToProfile(sender: AnyObject) {
            dismissViewControllerAnimated(true, completion: nil)
        
    }
    
   



}
