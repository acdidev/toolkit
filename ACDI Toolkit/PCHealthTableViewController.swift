//
//  PCHealthTableViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/30/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit
import SwiftyJSON

class PCHealthTableViewController: UITableViewController {
    
    @IBOutlet var systemInfoVersion: UILabel!
    
    @IBOutlet var systemInfoOperatingSystem: UILabel!
    
    @IBOutlet var systemInfoProcessors: UILabel!
    
    @IBOutlet var systemInfoArchitecture: UILabel!
    
    @IBOutlet var systemMetricsDiskSpaceFreeMB: UILabel!
    
    @IBOutlet var systemMetricsDiskSpaceTotalMB: UILabel!
    
    @IBOutlet var systemMetricsDiskSpaceUsedPercentage: UILabel!
    
    @IBOutlet var systemMetricsJvmMemoryMaxMB: UILabel!
    
    @IBOutlet var systemMetricsJvmMemoryTotalMB: UILabel!
    
    @IBOutlet var systemMetricsJvmMemoryUsedMB: UILabel!
    
    @IBOutlet var systemMetricsJvmMemoryUsedPercentage: UILabel!
    
    @IBOutlet var systemMetricsUptimeHours: UILabel!
    
    @IBOutlet var systemMetricsProcessCPULoadPercentage: UILabel!
    
    @IBOutlet var systemMetricsSystemCPULoadPercentage: UILabel!
    
    @IBOutlet var systemMetricsGetTimeMilliseconds: UILabel!
    
    @IBOutlet var systemMetricsGCExecutions: UILabel!
    
    
    @IBOutlet var systemMetricsThreadCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.green()
        
        parseURL(input: "http://104.130.70.75/api/health?Authorization=adtNetfm7bnlNTNzEe2iTTuxyuIOvkN7")
    }

    
    func parseURL(input: String){
        let url = URL(string: input)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                //Couldn't get the data
                return
            } else {
                //Data gotten
                
    //            let json  = JSON(data!)
                
   //             self.systemInfoVersion.text = json["applicationServer"]["systemInfo"]["version"].stringValue
  //              self.systemInfoOperatingSystem.text = json["applicationServer"]["systemInfo"]["operatingSystem"].stringValue
 //               self.systemInfoProcessors.text = json["applicationServer"]["systemInfo"]["processors"].stringValue
//                self.systemInfoArchitecture.text = json["applicationServer"]["systemInfo"]["architecture"].stringValue
            }
            }.resume()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
