//
//  MainTableViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/5/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    @IBOutlet var resultTableView: UITableView!
    
    let explanationList = [
        "Print Tracking: If your users know their printing is monitored they will reduce their printing. (i.e. no more holiday photos print-outs). This typically results in a reduction of 10-20%.",
        "Filter/Restrictions: Introducing restrictions can enforce duplex printing, or avoid accidentally printing 100s of pages instead of just one. This typically results in a reduction of 20-30%.",
        "Print quotas: Enforcing print quotas encourages responsible use of print resources. This typically results in a reduction of 30-50%."
    ]
    
    var explanation = String()
    var currentBW = String()
    var currentCL = String()
    var currentTotal = String()
    var projectedBW = String()
    var projectedCL = String()
    var projectedTotal = String()
    var savingsTotal = String()
    var savingsOver = String()

    @IBOutlet var explanationLabel: UILabel!
    @IBOutlet var currentBWLabel: UILabel!
    @IBOutlet var currentCLLabel: UILabel!
    @IBOutlet var currentTotalLabel: UILabel!
    @IBOutlet var projectedBWLabel: UILabel!
    @IBOutlet var projectedCLLabel: UILabel!
    @IBOutlet var projectedTotalLabel: UILabel!
    @IBOutlet var savingsTotalLabel: UILabel!
    @IBOutlet var savingsOverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.setCustomFont()
        self.navigationItem.setCustomFont()
        
        explanationLabel.text = explanation
        currentBWLabel.text = currentBW
        currentCLLabel.text = currentCL
        currentTotalLabel.text = currentTotal
        projectedBWLabel.text = projectedBW
        projectedCLLabel.text = projectedCL
        projectedTotalLabel.text = projectedTotal
        savingsTotalLabel.text = savingsTotal
        savingsOverLabel.text = savingsOver
        self.navigationController?.green()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onExit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "CircularStd-Book", size: 15)!
        header.textLabel?.textColor = UIColor.lightGray
    }
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer = view as! UITableViewHeaderFooterView
        footer.textLabel?.font = UIFont(name: "CircularStd-Book", size: 13)!
        footer.textLabel?.textColor = UIColor.lightGray
        
    }
}

