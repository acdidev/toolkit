//
//  MainTableViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/5/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class MainTableViewControllerEducation: UITableViewController {

    var itemSection = Int()
    var itemRow = Int()
    let currency = "$"
    
    @IBOutlet var averageCostBwValueLabel: UILabel!
    let averageCostBwIndex = Int()
    let averageCostBwTitle = "Avg. BW Cost per page"
    let averageCostBwSelections = [
        "0.0025",
        "0.0050",
        "0.0075",
        "0.01",
        "0.02",
        "0.03",
        "0.04",
        "0.05",
        "0.06",
        "0.07",
        "0.08",
        "0.09",
        "0.10",
        "0.15",
        "0.20",
        "0.25",
        "0.30",
        "0.35",
        "0.40",
        "0.45",
        "0.50",
        "0.55",
        "0.60",
        "0.65",
        "0.70",
        "0.75",
        "0.80",
        "0.85",
        "0.90",
        "0.95",
        "1.00",
        "1.50",
        "2.00",
        "2.50",
        "3.00",
        "3.50",
        "4.00",
        "4.50",
        "5.00"
    ]
    
    @IBOutlet var averageCostColorValueLabel: UILabel!
    let averageCostColorIndex = Int()
    let averageCostColorTitle = "Avg. BW Color per page"
    let averageCostColorSelections = [
        "0.0025",
        "0.0050",
        "0.0075",
        "0.01",
        "0.02",
        "0.03",
        "0.04",
        "0.05",
        "0.06",
        "0.07",
        "0.08",
        "0.09",
        "0.10",
        "0.15",
        "0.20",
        "0.25",
        "0.30",
        "0.35",
        "0.40",
        "0.45",
        "0.50",
        "0.55",
        "0.60",
        "0.65",
        "0.70",
        "0.75",
        "0.80",
        "0.85",
        "0.90",
        "0.95",
        "1.00",
        "1.50",
        "2.00",
        "2.50",
        "3.00",
        "3.50",
        "4.00",
        "4.50",
        "5.00"
    ]

    @IBOutlet var averageCountBwValueLabel: UILabel!
    let averageCountBwIndex = Int()
    let averageCountBwTitle = "Avg. BW pages per staff per day"
    let averageCountBwSelections = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "10",
        "15",
        "20",
        "25",
        "50",
        "75",
        "100",
        "125",
        "150",
        "200",
        "300",
        "500",
        "750",
        "1000",
        "1250",
        "1500"
    ]
    
    @IBOutlet var averageCountBwStudentValueLabel: UILabel!
    let averageCountBwStudentIndex = Int()
    let averageCountBwStudentTitle = "Avg. BW pages per student per day"
    let averageCountBwStudentSelections = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "10",
        "15",
        "20",
        "25",
        "50",
        "75",
        "100",
        "125",
        "150",
        "200",
        "300",
        "500",
        "750",
        "1000",
        "1250",
        "1500"
    ]
    
    @IBOutlet var averageCountColorValueLabel: UILabel!
    let averageCountColorIndex = Int()
    let averageCountColorTitle = "Avg. Color pages per staff per day"
    let averageCountColorSelections = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "10",
        "15",
        "20",
        "25",
        "50",
        "75",
        "100",
        "125",
        "150",
        "200",
        "300",
        "500",
        "750",
        "1000",
        "1250",
        "1500"
    ]
    
    @IBOutlet var averageCountColorStudentValueLabel: UILabel!
    let averageCountColorStudentIndex = Int()
    let averageCountColorStudentTitle = "Avg. Color pages per student per day"
    let averageCountColorStudentSelections = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "10",
        "15",
        "20",
        "25",
        "50",
        "75",
        "100",
        "125",
        "150",
        "200",
        "300",
        "500",
        "750",
        "1000",
        "1250",
        "1500"
    ]
    
    @IBOutlet var trackingModeValueLabel: UILabel!
    let trackingModeIndex = Int()
    let trackingModeTitle = "Staff print tracking mode"
    let trackingModeSelections = [
        "Print tracking",
        "Filter/Restrictions",
        "Print quotas"
    ]

    @IBOutlet var trackingModeStudentValueLabel: UILabel!
    let trackingModeStudentIndex = Int()
    let trackingModeStudentTitle = "Student print tracking mode"
    let trackingModeStudentSelections = [
        "Print tracking",
        "Filter/Restrictions",
        "Print quotas"
    ]
    
    @IBOutlet var timeValueLabel: UILabel!
    let timeIndex = Int()
    let timeTitle = "Show cost savings over"
    let timeSelections = [
        "5 Years",
        "10 Years",
        "15 Years"
    ]
    
    var outboundIndex = Int()
    var outboundTitle = String()
    var outboundSelections = [String]()
    
    @IBOutlet var currencyLabelBw: UILabel!
    @IBOutlet var currencyLabelColor: UILabel!
    @IBOutlet var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        currencyLabelBw.text = currency
        currencyLabelColor.text = currency

        self.navigationController?.green()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
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
        
        if indexPath.section == 1 {
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
        
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = averageCountBwStudentIndex
                outboundTitle = averageCountBwStudentTitle
                outboundSelections = averageCountBwStudentSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            } else if indexPath.row == 1 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = averageCountColorStudentIndex
                outboundTitle = averageCountColorStudentTitle
                outboundSelections = averageCountColorStudentSelections
                performSegue(withIdentifier: "mainToSelection", sender: self)
            } else if indexPath.row == 2 {
                itemSection = indexPath.section
                itemRow = indexPath.row
                outboundIndex = trackingModeStudentIndex
                outboundTitle = trackingModeStudentTitle
                outboundSelections = trackingModeStudentSelections
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mainToSelection" {
            let selectionVC = segue.destination as! SelectionTableViewControllerEducation
            selectionVC.itemRow = itemRow
            selectionVC.itemSection = itemSection
            selectionVC.itemIndex = outboundIndex
            selectionVC.itemTitle = outboundTitle
            selectionVC.itemSelections = outboundSelections
        } else if segue.identifier == "mainToResults" {
            
        }
        
    }
    
    @IBAction func didSelectEducation(segue: UIStoryboardSegue){
        let selectionVC = segue.source as! SelectionTableViewControllerEducation
        
        if selectionVC.itemSection == 0 {
            if selectionVC.itemRow == 0 {
                averageCostBwValueLabel.text = averageCostBwSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 1 {
                averageCostColorValueLabel.text = averageCostColorSelections[selectionVC.selectedIndex]
            }
        } else if selectionVC.itemSection == 1 {
            if selectionVC.itemRow == 0 {
                averageCountBwValueLabel.text = averageCountBwSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 1 {
                averageCountColorValueLabel.text = averageCountColorSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 2 {
                trackingModeValueLabel.text = trackingModeSelections[selectionVC.selectedIndex]
            }
        } else if selectionVC.itemSection == 2 {
            if selectionVC.itemRow == 0 {
                averageCountBwStudentValueLabel.text = averageCountBwStudentSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 1 {
                averageCountColorStudentValueLabel.text = averageCountColorStudentSelections[selectionVC.selectedIndex]
            } else if selectionVC.itemRow == 2 {
                trackingModeStudentValueLabel.text = trackingModeStudentSelections[selectionVC.selectedIndex]
            }
        }

        if selectionVC.itemSection == 3 {
            if selectionVC.itemRow == 0 {
                timeValueLabel.text = timeSelections[selectionVC.selectedIndex]
            }
        }

    
    
    }
}
