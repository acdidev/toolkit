//
//  GetQuoteViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/24/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class GetQuoteViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var quoteWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteWebView.delegate = self
        let url = URL(string:"https://acdiforms.wufoo.com/forms/q13v4x2912rbwhb/")
        quoteWebView.loadRequest(URLRequest(url: url!))
        self.navigationController?.green()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.startAnimating()
        print("Start")

    }
    
    @IBAction func onExit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.stopAnimating()
        print("Done")
    }
    
}
extension UINavigationItem {
    func setCustomFont() {
        self.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!], for: .normal)
        self.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!], for: .selected)
        self.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!], for: .disabled)
        self.rightBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!], for: .normal)
        self.rightBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!], for: .selected)
        self.rightBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!], for: .disabled)
    }
}
extension UINavigationController {
    func setCustomFont() {
        self.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "CircularStd-Book", size: 17)!]
        
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
}
