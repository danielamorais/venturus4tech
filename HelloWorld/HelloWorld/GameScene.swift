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
    var enemyList:Array<Enemy> = Array<Enemy>()
    //opcional: var enemiesList = Array<Enemy>()
    var armoredEnemy:ArmoredEnemy = ArmoredEnemy()
    var shoot = Shoot()
    let starship = SKSpriteNode(imageNamed: "Spaceship")
    let background = SKSpriteNode(imageNamed: "background")
    //var enemyStartship
    var touchLocation:CGPoint?
    
    //FIXME
    /*
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            touchLocation = touch.locationInView(view)
            print(position)
        }
    }
    */

    
    override func didMoveToView(view: SKView) {
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        starship.xScale = 0.5
        starship.yScale = 0.5
        addChild(background)
        addChild(starship)
        
        //let actionMove = SKAction.moveTo(touchLocation!, duration: 0.5)
        
        //createEnemies(10)
        let moveable1:MoveProtocol = shoot
        let moveable2:MoveProtocol = enemy2
        
        moveable1.startMove()
        moveable2.stopMove()
        
        var intHP = Int(hp)
        print("weapon description \(weapon.0) and \(weapon.1)")
        print("HP Integer \(intHP)")
        print("Enemy health\(enemy.healthPoints)")
        print("Enemy State\(enemy.enemyState)")
        enemy.doAttack()
        enemy.receivePlayerAttack(0, weapon:"blabla", teste:1)
        //Se existem mais de um atributo p/ serem passados, sempre deixar explicito os próximos
        let playerDamage = enemy.doPowerStrike(10, playerY: 10)
        print("Player Damage \(playerDamage)")
        enemy.damage = 10
        print("damage \(enemy.damage)")
        enemyList.append(enemy)
        enemyList.append(enemy2)
        enemyList.append(armoredEnemy) //polimorfismo
        print("\(enemyList[0].healthPoints)")
        print("\(enemyList[1].healthPoints)")
        
        enemyList.removeAtIndex(1)
        
        enemy.name = "sdsdfdsf"
        print("Enemy name \(enemy.name!)")
        if let name = enemy.name {
            print("The value of name is \(name)")
        } else {
            print("The value of name isn't defined")
        }
        
        /*
        if let _ = enemy.name {
        print("Not nil")
        } else {
        print("The value of name isn't defined")
        }
        */
        
        armoredEnemy.doAttack()
        armoredEnemy.blastAttack()
        
        orderAllEnemiesToAttack()
    }
    
    func orderAllEnemiesToAttack() {
        for enemy in enemyList {
            //Verificar se o inimigo é armored ou comum
            if let storedEnemy = enemy as? ArmoredEnemy {
                storedEnemy.blastAttack()
            } else {
                //storedEnemy é um optional, pode ser nulo ou ArmoredEnemy. Aqui eh nulo
                enemy.doAttack()
            }
        }
    }
    
    func createEnemies(quantity:Int) {
        //for var i in 1...quantity: porem como i nao é usado pode-se usar _
        for _ in 1...quantity {
            enemyList.append(Enemy())
        }
        enemyList.append(ArmoredEnemy())
    }
    
    func startMove(){
        
    }
    
    func stopMove(){
        
    }
}
