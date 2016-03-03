//
//  CustomTabBar.swift
//  Figofy
//
//  Created by Mohammed Joseph Petrelli Salameh on 12/02/16.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate {
    
    
    @IBOutlet weak var tabBarUI: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        tabBarUI.barStyle = UIBarStyle.Default
        tabBarUI.alpha = 1
        tabBarUI.backgroundColor = UIColor(red: 23/255, green: 45/255, blue: 130/255, alpha: 1)
        tabBarUI.tintColor = UIColor.whiteColor()
        
        
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            //tabBar.backgroundColor = UIColor.blueColor()
            
            //ROtation animation
//            let rotateAnim = CABasicAnimation(keyPath: "transform.rotation")
//            rotateAnim.fromValue = 0
//            let toValue = CGFloat(6)
//            rotateAnim.toValue = toValue
//            tabBar.layer.addAnimation(rotateAnim, forKey: "rotation360")
            
            
            //Bounce Animation
//            let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
//            bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0] //values to bounce between
//            bounceAnimation.duration = 2.5
//            bounceAnimation.calculationMode = kCAAnimationCubic
//            tabBar.layer.addAnimation(bounceAnimation, forKey: "bounceAnimation")
            
            //frame Animation
            let frameAnimation = CAKeyframeAnimation(keyPath: "contents")
            frameAnimation.calculationMode = kCAAnimationDiscrete
            frameAnimation.duration = 2.5
            frameAnimation.values = [UIImage]()//images
            frameAnimation.repeatCount = 1;
            frameAnimation.removedOnCompletion = false;
            frameAnimation.fillMode = kCAFillModeForwards;
            tabBar.layer.addAnimation(frameAnimation, forKey: "frameAnimation")
            
            
        })
    }
    
    
    //For fun
//    func randomColor () -> UIColor {
//        let hue: CGFloat = CGFloat(arc4random()%256) / 256
//        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
//        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
//        
//        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
//    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let tabBarController = segue.destinationViewController as! UITabBarController
//        if segue.identifier == SEGUE_LOGGED_IN {
//            if let profileView = tabBarController.viewControllers![0] as? ProfileViewController {
//                if let user = sender as? FigofyUser {
//                    profileView.user = user
//                }
//            }
//        }
//    }
    

}
