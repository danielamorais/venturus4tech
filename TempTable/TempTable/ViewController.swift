//
//  ViewController.swift
//  TempTable
//
//  Created by vntlab on 7/15/16.
//  Copyright © 2016 danielamorais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tempList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Metodo disparado sempre que sai de uma view para outra (conceito da setinha)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let rand = Int(arc4random_uniform(10))
        tempList.append("Tempo \(Int(arc4random_uniform(10)))")
        let tempTableViewController = segue.destinationViewController as? TempTableViewController //o segue.destination.. sabe qual eh o proximo view controller que esta indo
        tempTableViewController?.tempList = tempList 
    }

}

