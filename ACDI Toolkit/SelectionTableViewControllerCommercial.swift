//
//  SelectionTableViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/5/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit

class SelectionTableViewControllerCommercial: UITableViewController {
    
    var itemIndex = Int()
    var itemTitle = "Average BW Color per page"
    var itemSelections = [String]()
    var itemSection = Int()
    var itemRow = Int()

    var selectedIndex = Int()

    @IBOutlet var selectionTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = itemTitle
    }

    @IBAction func onExit(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemSelections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell", for: indexPath) as! SelectionTableViewCell
        cell.itemLabel.text = itemSelections[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectionToHomeCommercial", sender: self)
    }
}

