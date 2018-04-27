//
//  HomeViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/5/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.clear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onExit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func papercutKB(_ sender: Any) {
        let url = URL(string: "https://www.papercut.com/kb/")!
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

extension UINavigationController {
    func clear(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
    func green(){
        let acdiGreen = UIColor(red: 140/255, green: 198/255, blue: 63/255, alpha: 1)
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = acdiGreen

    }
    
    
    
}
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

extension Double {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
