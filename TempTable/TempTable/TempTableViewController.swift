//
//  TempTableViewController.swift
//  TempTable
//
//  Created by vntlab on 7/15/16.
//  Copyright © 2016 danielamorais. All rights reserved.
//

import UIKit

class TempTableViewController: UITableViewController {
    
    var tempList = [String]() //array de stirngs
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tempCell", forIndexPath: indexPath)
        cell.textLabel?.text = tempList[indexPath.row]
        return cell
        
    }
    
}