//
//  MainTableViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/5/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class MainTableViewControllerCommercial: UITableViewController, UITextFieldDelegate {

    var itemSection = Int()
    var itemRow = Int()
    let currency = "$"
    let daysPerYear = 200
    
    @IBOutlet var averageCostBwValueLabel: UILabel!
    let averageCostBwIndex = Int()
    let averageCostBwTitle = "Avg. BW Cost per page"
    let averageCostBwSelections = ["0.0025","0.0050","0.0075","0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09","0.10","0.15","0.20","0.25","0.30","0.35","0.40","0.45","0.50","0.55","0.60","0.65","0.70","0.75","0.80","0.85","0.90","0.95","1.00","1.50","2.00","2.50","3.00","3.50","4.00","4.50","5.00"]

    @IBOutlet var averageCostColorValueLabel: UILabel!
    let averageCostColorIndex = Int()
    let averageCostColorTitle = "Avg. BW Color per page"
    let averageCostColorSelections =
    ["0.0025","0.0050","0.0075","0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09","0.10","0.15","0.20","0.25","0.30","0.35","0.40","0.45","0.50","0.55","0.60","0.65","0.70","0.75","0.80","0.85","0.90","0.95","1.00","1.50","2.00","2.50","3.00","3.50","4.00","4.50","5.00"]

    @IBOutlet var averageCountBwValueLabel: UILabel!
    let averageCountBwIndex = Int()
    let averageCountBwTitle = "Avg. BW pages per user per day"
    let averageCountBwSelections = [ "1","2","3","4","5","10","15","20","25","50","75","100","125","150","200","300","500","750","1000","1250","1500"]
    
    @IBOutlet var averageCountColorValueLabel: UILabel!
    let averageCountColorIndex = Int()
    let averageCountColorTitle = "Avg. Color pages per user per day"
    let averageCountColorSelections = [ "1","2","3","4","5","10","15","20","25","50","75","100","125","150","200","300","500","750","1000","1250","1500"]
    
    @IBOutlet var trackingModeValueLabel: UILabel!
    var trackingModeIndex = Int()
    let trackingModeTitle = "Print tracking mode"
    let trackingModeSelections = [
        "Print tracking",
        "Filter/Restrictions",
        "Print quotas"
    ]
    let trackingModeSelectionsReduction = [
        20,
        30,
        50
    ]

    @IBOutlet var timeValueLabel: UILabel!
    var timeIndex = Int()
    let timeTitle = "Show cost savings over"
    let timeSelections = [
        "5 Years",
        "10 Years",
        "15 Years"
    ]
    let timeSelectionsValue = [
        5,
        10,
        15
    ]
    
    let explanationList = [
        "Print Tracking: If your users know their printing is monitored they will reduce their printing. (i.e. no more holiday photos print-outs). This typically results in a reduction of 10-20%.",
        "Filter/Restrictions: Introducing restrictions can enforce duplex printing, or avoid accidentally printing 100s of pages instead of just one. This typically results in a reduction of 20-30%.",
        "Print quotas: Enforcing print quotas encourages responsible use of print resources. This typically results in a reduction of 30-50%."
    ]
    
    var outboundIndex = Int()
    var outboundTitle = String()
    var outboundSelections = [String]()

    var currentBW = Double()
    var currentCL = Double()
    var projectedBW = Double()
    var projectedCL = Double()
    var totalSavings = Double()
    
    @IBOutlet var numberOfStaffField: UITextField!
    @IBOutlet var totalSavingsLabel: UILabel!
    @IBOutlet var totalPercentageLabel: UILabel!
    @IBOutlet var detailsButton: UIButton!
    
    @IBOutlet var currencyLabelBw: UILabel!
    @IBOutlet var currencyLabelColor: UILabel!
    @IBOutlet var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUserDefaults()
        self.hideKeyboardWhenTappedAround()
        self.detailsButton.alpha = 0
        
        self.navigationController?.setCustomFont()
        self.navigationItem.setCustomFont()

        self.numberOfStaffField.delegate = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        currencyLabelBw.text = currency
        currencyLabelColor.text = currency
        self.navigationController?.green()
    }
    func setUserDefaults(){
        if UserDefaults.standard.string(forKey: "numberOfStaffField") != nil {
            self.numberOfStaffField.text = "\(UserDefaults.standard.string(forKey: "numberOfStaffField")!)"
        } else {
            self.numberOfStaffField.text = "100"
        }
        
        if UserDefaults.standard.string(forKey: "averageCostBwValueLabel") != nil {
            self.averageCostBwValueLabel.text = "\(UserDefaults.standard.string(forKey: "averageCostBwValueLabel")!)"
        } else {
            self.averageCostBwValueLabel.text = "---"
        }
        
        if UserDefaults.standard.string(forKey: "averageCostColorValueLabel") != nil {
            self.averageCostColorValueLabel.text = "\(UserDefaults.standard.string(forKey: "averageCostColorValueLabel")!)"
        } else {
            self.averageCostColorValueLabel.text = "---"
        }
        
        if UserDefaults.standard.string(forKey: "averageCountBwValueLabel") != nil {
            self.averageCountBwValueLabel.text = "\(UserDefaults.standard.string(forKey: "averageCountBwValueLabel")!)"
        } else {
            self.averageCountBwValueLabel.text = "---"
        }

        if UserDefaults.standard.string(forKey: "averageCountColorValueLabel") != nil {
            self.averageCountColorValueLabel.text = "\(UserDefaults.standard.string(forKey: "averageCountColorValueLabel")!)"
        } else {
            self.averageCountColorValueLabel.text = "---"
        }

        if UserDefaults.standard.string(forKey: "trackingModeValueLabel") != nil {
            self.trackingModeValueLabel.text = "\(UserDefaults.standard.string(forKey: "trackingModeValueLabel")!)"
        }

        if UserDefaults.standard.string(forKey: "timeValueLabel") != nil {
            self.timeValueLabel.text = "\(UserDefaults.standard.string(forKey: "timeValueLabel")!)"
        }
        
        if UserDefaults.standard.integer(forKey: "trackingModeIndex") != nil {
            self.trackingModeIndex = UserDefaults.standard.integer(forKey: "trackingModeIndex")
        } else {
            self.trackingModeIndex = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.process()
    }
    
    @IBAction func onExit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func process(){
        let numberOfStaff = Int(numberOfStaffField.text!)!
        UserDefaults.standard.set("\(numberOfStaff)", forKey: "numberOfStaffField")

        UserDefaults.standard.set("\(averageCostBwValueLabel.text!)", forKey: "averageCostBwValueLabel")
        UserDefaults.standard.set("\(averageCostColorValueLabel.text!)", forKey: "averageCostColorValueLabel")
        UserDefaults.standard.set("\(averageCountBwValueLabel.text!)", forKey: "averageCountBwValueLabel")
        UserDefaults.standard.set("\(averageCountColorValueLabel.text!)", forKey: "averageCountColorValueLabel")
        UserDefaults.standard.set("\(trackingModeValueLabel.text!)", forKey: "trackingModeValueLabel")
        UserDefaults.standard.set("\(timeValueLabel.text!)", forKey: "timeValueLabel")
        UserDefaults.standard.set(trackingModeIndex, forKey: "trackingModeIndex")
        
        if (averageCostBwValueLabel.text != "---" && averageCostColorValueLabel.text != "---" && averageCountBwValueLabel.text != "---" && averageCountColorValueLabel.text != "---") {
            
            currentBW = Double("\(averageCostBwValueLabel.text ?? "0")")! * Double("\(averageCountBwValueLabel.text ?? "0")")! * Double(daysPerYear) * Double(timeSelectionsValue[timeIndex]) * Double(numberOfStaff)
            
            currentCL = Double("\(averageCostColorValueLabel.text ?? "0")")! * Double("\(averageCountColorValueLabel.text ?? "0")")! * Double(daysPerYear) * Double(timeSelectionsValue[timeIndex]) * Double(numberOfStaff)
            
            projectedBW = currentBW * (Double(100 - trackingModeSelectionsReduction[trackingModeIndex])/100)
            projectedCL = currentCL * (Double(100 - trackingModeSelectionsReduction[trackingModeIndex])/100)
            
            totalSavings  = ((currentBW + currentCL) - (projectedBW + projectedCL))
            
            print("currentBW = \(currentBW.formattedWithSeparator)")
            print("currentCL = \(currentCL.formattedWithSeparator)")
            print("timeSelection = \((timeSelectionsValue[timeIndex]))")
            print("tracking Mode = \(trackingModeSelectionsReduction[trackingModeIndex])")
            print("projectedBW = \(projectedBW.formattedWithSeparator)")
            print("projectedCL = \(projectedCL.formattedWithSeparator)")
            print("totalSavings = \(totalSavings.formattedWithSeparator)")
            print("==========")
            
            self.navigationItem.title = "Est. Savings: $\(totalSavings.formattedWithSeparator)"
            totalSavingsLabel.text = "$\(totalSavings.formattedWithSeparator)"
            totalPercentageLabel.text = "\(trackingModeSelectionsReduction[trackingModeIndex])%"
            detailsButton.alpha = 1
            
        }
            
        else {
            totalSavingsLabel.text = "---"
            totalPercentageLabel.text = "---"
            detailsButton.alpha = 0
        }
        
        self.mainTableView.reloadData()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.text = "100"
        }
        self.process()
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = averageCostBwIndex
                outboundTitle = averageCostBwTitle
                outboundSelections = averageCostBwSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            } else if indexPath.row == 1 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = averageCostColorIndex
                outboundTitle = averageCostColorTitle
                outboundSelections = averageCostColorSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            }
        }
        
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = averageCountBwIndex
                outboundTitle = averageCountBwTitle
                outboundSelections = averageCountBwSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            } else if indexPath.row == 1 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = averageCountColorIndex
                outboundTitle = averageCountColorTitle
                outboundSelections = averageCountColorSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            } else if indexPath.row == 2 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = trackingModeIndex
                outboundTitle = trackingModeTitle
                outboundSelections = trackingModeSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            }
        }
        
        if indexPath.section == 3 {
            if indexPath.row == 0 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = timeIndex
                outboundTitle = timeTitle
                outboundSelections = timeSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 2 {
            return explanationList[trackingModeIndex]
        } else {
            return ""
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToSelection" {
            let selectionVC = segue.destination as! SelectionTableViewControllerCommercial
            selectionVC.itemRow = itemRow
            selectionVC.itemSection = itemSection
            selectionVC.itemIndex = outboundIndex
            selectionVC.itemTitle = outboundTitle
            selectionVC.itemSelections = outboundSelections
            
        } else if segue.identifier == "mainToResults" {
            let resultsVC = segue.destination as! ResultsTableViewController
            
            resultsVC.explanation = resultsVC.explanationList[trackingModeIndex]
            resultsVC.currentBW = "\(self.currentBW.formattedWithSeparator)"
            resultsVC.currentCL = "\(self.currentCL.formattedWithSeparator)"
            resultsVC.currentTotal = "\((self.currentBW + self.currentCL).formattedWithSeparator)"
            resultsVC.projectedBW = "\(self.projectedBW.formattedWithSeparator)"
            resultsVC.projectedCL = "\(self.projectedCL.formattedWithSeparator)"
            resultsVC.projectedTotal = "\((self.projectedBW + self.projectedCL).formattedWithSeparator)"
            resultsVC.savingsTotal = "$\(totalSavings.formattedWithSeparator)"
            resultsVC.savingsOver = "SAVINGS ON \((timeSelectionsValue[timeIndex])) YEARS"
        }
    }
    
    @IBAction func didSelectCommercial(segue: UIStoryboardSegue){
        let selectionVC = segue.source as! SelectionTableViewControllerCommercial
        
        if selectionVC.itemSection == 1 {
            if selectionVC.itemRow == 0 {
                averageCostBwValueLabel.text = averageCostBwSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 1 {
                averageCostColorValueLabel.text = averageCostColorSelections[selectionVC.selectedIndex]
            }
        } else if selectionVC.itemSection == 2 {
            if selectionVC.itemRow == 0 {
                averageCountBwValueLabel.text = averageCountBwSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 1 {
                averageCountColorValueLabel.text = averageCountColorSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 2 {
                trackingModeValueLabel.text = trackingModeSelections[selectionVC.selectedIndex]
                trackingModeIndex = selectionVC.selectedIndex
            }
        }
        if selectionVC.itemSection == 3 {
            if selectionVC.itemRow == 0 {
                timeValueLabel.text = timeSelections[selectionVC.selectedIndex]
                timeIndex = selectionVC.selectedIndex
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}




