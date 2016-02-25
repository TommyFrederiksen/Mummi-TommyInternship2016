//
//  MobilePayViewController.swift
//  Figofy
//
//  Created by Tommy on 21/01/2016.
//  Copyright © 2016 Tommy. All rights reserved.
//

import UIKit

class MobilePayViewController: UIViewController {
    
    
    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var amount: TextFieldDesign!
    
    
    var payment: MobilePayPayment?
    var alert: AlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alert = AlertView()
        
        payBtn.layer.cornerRadius = 5.0
    }
    
    
    @IBAction func payBtnPressed(sender: AnyObject) {
        
        if let price = Float(self.amount.text!) where price >= 0 {
            
            let Id = "3232"
            
            if price >= 0 && Id != "" {
                payment = MobilePayPayment(orderId: Id, productPrice: price)
                MobilePayManager.sharedInstance().beginMobilePaymentWithPayment(payment!) { error in
                    if error.localizedDescription != "" {
                        print(error.localizedDescription)
                    }
                    
                    
                }
                
            }
        }
        
        
        //alert.showOkayAlert("MobilePay Initialized", message: "Switching to MobilePay \(orderId: payment.orderId, transactionId: info.transactionId, info.amountWithdrawnFromCard))", style: .Alert, VC: self)
        
    }
}
