//
//  MainViewController.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 12/10/15.
//  Copyright © 2015 venturus. All rights reserved.
//

import UIKit

class MainViewController:UIViewController{
    
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var lampSwitch: UISwitch!
    
    override func viewDidLoad() {
        lampSwitch.addTarget(self, action: Selector("switchLamp"), forControlEvents: UIControlEvents.ValueChanged)
        temperatureImage.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("fetchTemperature"))
        
        
        
        
        temperatureImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func fetchTemperature() {
        temperatureLabel.text = temperatureLabel.text! + "a"
    }
    
    func switchLamp() {
        print("Value chnaged!")
    }
    
    func fetchLampState() {
    
    
    }
    
}
