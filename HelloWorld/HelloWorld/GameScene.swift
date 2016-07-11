//
//  GameScene.swift
//  HelloWorld
//
//  Created by vntlab on 7/11/16.
//  Copyright (c) 2016 danielamorais. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var score:Int = 0
    var hp = 100.10
    var gameOver = false
    var scoreText:String = "Score :"
    let xPosition = 400
    let yPosition = 300.50
    let weapon = ("shiriken", 100)
    let enemy:Enemy = Enemy()
    let enemy2:Enemy = Enemy(healthPoints: 400)
    
    override func didMoveToView(view: SKView) {
        var intHP = Int(hp)
        print("Position x \(xPosition)")
        print("Position x \(yPosition)")
        print("HP \(hp)")
        print("weapon description \(weapon.0) and \(weapon.1)")
        print("HP Integer \(intHP)")
        print("Enemy health points \(enemy.healthPoints)")
        print("Enemy health\(enemy.healthPoints)")
        print("Enemy health \(enemy2.healthPoints)")
    }
}
