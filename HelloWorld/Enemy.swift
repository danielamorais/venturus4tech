//
//  Enemy.swift
//  HelloWorld
//
//  Created by vntlab on 7/11/16.
//  Copyright © 2016 danielamorais. All rights reserved.
//

import Foundation

class Enemy {
    var healthPoints:Int = 5
    
    var damage:Int{
        get{
            print("GET!")
            return self.damage
        }
        set(newValue){
            print("SET \(newValue)")
            self.damage = newValue
        }
    }
    
}