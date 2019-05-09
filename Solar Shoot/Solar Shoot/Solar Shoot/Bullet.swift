//
//  Bullet.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 08/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

//Classe pour afficher les missiles

import Foundation
import SpriteKit
import GameplayKit
class Bullet {
    
    var bullet = SKSpriteNode()
    
    
    func addBullet (imageName: String, parent : GameScene, player: Planet) {
        
        let bullet = SKSpriteNode(imageNamed : imageName)
        bullet.name = "Bullet"
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody?.affectedByGravity = false
        bullet.physicsBody?.categoryBitMask = GameScene.physicsCategories.bullet
        bullet.physicsBody?.collisionBitMask = GameScene.physicsCategories.none
        bullet.physicsBody?.contactTestBitMask = GameScene.physicsCategories.asteroid
        
        bullet.setScale(0.5)
        bullet.position = CGPoint(x: player.position.x, y: player.position.y)
        bullet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bullet.zPosition = 1
        
        parent.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: parent.size.height + bullet.size.height, duration: 1.0)
        let deleteBullet = SKAction.removeFromParent()
        if(sons.getSonsActivee()){
            let bulletSequence = SKAction.sequence([sons.getBulletSound(), moveBullet, deleteBullet])
            bullet.run(bulletSequence)
        }
        else{
            print("else:",sonsActivee)
            let bulletSequence = SKAction.sequence([moveBullet, deleteBullet])
            bullet.run(bulletSequence)
        }
        
        
    }
    
    
}





