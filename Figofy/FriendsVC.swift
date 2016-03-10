//
//  FriendsVC.swift
//  Figofy
//
//  Created by Tommy on 09/03/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import Foundation

class FriendsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    var friendsImg = ["man1","man2","man3","man4","female1","female2","man8","man5","man6","man7"]
    var friendsName = ["Søren","Kim","Lasse","Jonas","Vibeke","Lullu","Ib","Gerner","Hans","Ole"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
        
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {

            let img = UIImage(named: friendsImg[indexPath.row])
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FriendsCell", forIndexPath: indexPath) as? FriendsCell
            {
                if let profielImg = img {
                    cell.configureCell(profielImg, text: friendsName[indexPath.row])
                    
                }
                cell.layer.cornerRadius = 15
                cell.mainImg.layer.cornerRadius = cell.mainImg.layer.frame.width/2
                cell.mainImg.clipsToBounds = true
                return cell
            }
            else
            {
                return FriendsCell()
            }
        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsImg.count
    }
    
    @IBAction func backToProfile(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}
