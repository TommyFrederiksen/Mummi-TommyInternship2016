//
//  MapViewViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Contacts

class MapViewViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
     //default value of the starting zoom
    let regionRadius: CLLocationDistance = 1000
    
    let addresses = ["Kalkgravsvej 22, 4000 roskilde", "Fiskervejen 75,4000 Roskilde" , "Holmevej 41,3670 Veksø"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        
        for add in addresses {
            getPlacemarkFromAddress(add)
        }
        
    
        
    }
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }
    
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            centerMapOnLocation(loc)
        }
    }
    
    //calls before each annotation is placed
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        //for an IMAGE
        //let reuseId = "figofy"
        //var annoView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        //annoView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        //annoView!.image = UIImage(named: "PinLogo")
        
        if annotation.isKindOfClass(SeaAnnotation){
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annoView.animatesDrop = true
            annoView
            return annoView
            
        } else if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        return nil
    }
    
    func createAnnotationForLocation(location: CLLocation) {
        let sea = SeaAnnotation(coordinate: location.coordinate)
        
        map.addAnnotation(sea)
        
    }
    
    func getPlacemarkFromAddress(address: String){
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let marks = placemarks where marks.count > 0 {
                if let loc = marks[0].location {
                    //we have a location with coordinates
                    self.createAnnotationForLocation(loc)
                }
            }
        }
    }

    
    
}