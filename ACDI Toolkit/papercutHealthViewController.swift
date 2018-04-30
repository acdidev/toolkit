//
//  papercutHealthViewController.swift
//  ACDI Toolkit
//
//  Created by Dan on 4/28/18.
//  Copyright © 2018 Access Control Devices Inc. All rights reserved.
//

import UIKit
import SwiftyJSON



class papercutHealthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseURL(input: "http://104.130.70.75/api/health?Authorization=adtNetfm7bnlNTNzEe2iTTuxyuIOvkN7")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseURL(input: String){
        let url = URL(string: input)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                //Couldn't get the data
                return
            } else {
                //Data gotten
                
                let json  = JSON(data!)
                print(json["applicationServer"]["systemInfo"]["processors"])
            }
        }.resume()
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
