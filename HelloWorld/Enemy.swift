//
//  Enemy.swift
//  HelloWorld
//
//  Created by vntlab on 7/11/16.
//  Copyright © 2016 danielamorais. All rights reserved.
//

import Foundation

class Enemy {
    enum EnemyState {
        case Idle
        case Attacking
        case Moving
    }
    
    struct InitialPosition {
        var posX:Int = 0
        var posY:Int = 0
    }
    
    var healthPoints:Int = 0
    var enemyState:EnemyState = EnemyState.Idle
    
    init(){
        
    }
    
    init(healthPoints:Int){
        self.healthPoints = healthPoints
    }
    
    func doAttack() {
        print("doAttack")
    }
    
    func receivePlayerAttack(hitpoints:Int, weapon:String, teste:Int){
        print("hit point \(hitpoints)")
    }
    
    //O -> deixa explicito o retorno da funcao
    func doPowerStrike(playerX:Int, playerY:Int) -> Int{
        print("doPowerStrike")
        return 1000
    }
    
}