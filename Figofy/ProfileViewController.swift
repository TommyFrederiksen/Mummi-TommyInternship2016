//
//  ProfileViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var favoriteSeaCollectionView: UICollectionView!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    
    var favoriteSeasImg = ["EventImage1","EventImage2","EventImage3","EventImage1","EventImage2","EventImage3","EventImage1","EventImage2","EventImage3","EventImage1"]
    var favoriteSeasTxt = ["Simons Put & Take","Fede Sø","Super Sø","Fisker Sø","Kæmpe Sø","Mini Sø","Ibs Sø","Hannes Sø","Lenes Sø","SønderSø"]
    var friendsImg = ["man","man","man","man","man","man","man","man","man","man"]
    var friendsName = ["Søren","Kim","Lasse","Jonas","Vibeke","Lullu","Ib","Gerner","Hans","Ole"]
    
    @IBOutlet weak var logBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var editImageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteSeaCollectionView.delegate = self
        favoriteSeaCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        profileImageView.clipsToBounds = true
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        if collectionView == favoriteSeaCollectionView
        {
            let img = UIImage(named: favoriteSeasImg[indexPath.row])
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FavoriteSeaCell", forIndexPath: indexPath) as? FavoriteSeaCell
            {
                cell.configureCell(img!, text: favoriteSeasTxt[indexPath.row])
                return cell
            }else{
                return FavoriteSeaCell()
            }
            
        }
        if collectionView == friendsCollectionView {
            let img = UIImage(named: friendsImg[indexPath.row])
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FriendsCell", forIndexPath: indexPath) as? FavoriteSeaCell
            {
                if let profielImg = img {
                   cell.configureCell(profielImg, text: friendsName[indexPath.row])
                 
                }
                return cell
            }
            else
            {
                return FavoriteSeaCell()
            }
            
        }
        else
        {
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