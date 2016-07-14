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
        // Adicionando um Target, que vai procurar a func "switchLamp" quando o lampSwitch mudar de valor
        lampSwitch.addTarget(self, action:Selector("switchLamp"), forControlEvents: UIControlEvents.ValueChanged);
        
        // Adicionando um target, que vai procurar a funcao "fetchTemperature", quando for tocado
        temperatureImage.userInteractionEnabled = true;
        let tapGestureRecognizer = UITapGestureRecognizer (target: self, action: Selector("fetchTemperature"));
        temperatureImage.addGestureRecognizer(tapGestureRecognizer);
        NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: "fetchLampState", userInfo: nil, repeats: true)
    }
    
    func fetchTemperature() {
        IOTService.sharedInstance.fetchTemperature(){(statuscode, error, homeModel) -> Void in
            print("Temperature ready to be displayed")
            //Aqui devido ao dispatch_async já está na thread main
            self.temperatureLabel.text = "\(homeModel!.temperatureValue)"
        }
        print("fetchTemperature in Progress..");
    }
    
    func switchLamp() {
        //lampSwitch.on se refere a estado booleano e nao estado fisico da lampada (desligado/ligado)
        IOTService.sharedInstance.switchLamp(lampSwitch.on){
            (statuscode, error) in
            print("Lamp Switch response")
        }
    }
    
    func fetchLampState() {
        IOTService.sharedInstance.fetchLampState(){(statuscode, error) -> Void in
            //print("\(statuscode)")
            if(statuscode == 200) {
                self.lampSwitch.setOn(true, animated: true)
            } else {
                self.lampSwitch.setOn(false, animated: true)
            }
            
        }
    }
    
}
