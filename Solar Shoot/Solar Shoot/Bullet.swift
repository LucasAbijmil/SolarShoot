//
//  Bullet.swift
//  Solar Shoot
//
//  Created by Projet-L2R1 on 08/04/2019.
//  Copyright © 2019 Projet-L2R1. All rights reserved.
//

//Classe pour afficher les missiles

import Foundation
import SpriteKit
import GameplayKit

class Bullet : SKSpriteNode {
    
    //construteur
    init(imageName: String) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "Bullet"
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = GameScene.physicsCategories.bullet
        self.physicsBody?.collisionBitMask = GameScene.physicsCategories.none
        self.physicsBody?.contactTestBitMask = GameScene.physicsCategories.asteroid
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addBullet (parent : GameScene, player: Planet) {
        
        self.setScale(0.5)
        self.position = CGPoint(x: player.position.x, y: player.position.y)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 1

        parent.addChild(self)
        
       
    }
    
    
}





