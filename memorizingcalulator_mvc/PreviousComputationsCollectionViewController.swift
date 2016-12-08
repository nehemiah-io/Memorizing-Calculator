//
//  PreviousComputationsCollectionViewController.swift
//  memorizingcalculator
//
//  Created by Nehemiah Igbadumhe-Odior on 11/15/16.
//  Copyright © 2016 niidmogames. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class PreviousComputationsCollectionViewController: UITableViewController {
    
    var viewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! PreviousComputationTableViewCell
        let calculations = viewController.computations[indexPath.row]
        cell.textLabel?.text = calculations.ansewrSentance
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.computations.count
    }

}
