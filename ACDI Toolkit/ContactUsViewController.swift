//
//  ContactUsViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/23/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func callSales(_ sender: Any) {
        let numberUrl = URL(string: "tel:+18772903327")!
        if #available(iOS 10, *) {
            UIApplication.shared.open(numberUrl)
        } else {
            UIApplication.shared.openURL(numberUrl)
        }
    }
    
    @IBAction func callTechnical(_ sender: Any) {
        let numberUrl = URL(string: "tel:+18772903327")!
        if #available(iOS 10, *) {
            UIApplication.shared.open(numberUrl)
        } else {
            UIApplication.shared.openURL(numberUrl)
        }
    }
    
    @IBAction func callOffice(_ sender: Any) {
        let numberUrl = URL(string: "tel:+18009902234")!
        if #available(iOS 10, *) {
            UIApplication.shared.open(numberUrl)
        } else {
            UIApplication.shared.openURL(numberUrl)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
