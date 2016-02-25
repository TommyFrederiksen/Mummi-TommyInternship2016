//
//  ProfileViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    
    var favoriteSeasImg = ["EventImage1","EventImage2","EventImage3","EventImage1","EventImage2","EventImage3"]
    var favoriteSeasTxt = ["Simons Put & Take","Fede Sø","Super Sø","Fisker Sø","Kæmpe Sø","Mini Sø"]
    
    @IBOutlet weak var logBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
 
    @IBOutlet weak var editImageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    
        // Do any additional setup after loading the view, typically from a nib.
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        profileImageView.clipsToBounds = true
    
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let img = UIImage(named: favoriteSeasImg[indexPath.row])
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FavoriteSeaCell", forIndexPath: indexPath) as? FavoriteSeaCell
        {
            cell.configureCell(img!, text: favoriteSeasTxt[indexPath.row])
            return cell
        }else{
           return FavoriteSeaCell()
        }
       
        
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteSeasImg.count
    }
    
    
    
    
    
    
    
}
