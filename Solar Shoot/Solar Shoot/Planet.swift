//
//  Planet.swift
//  Solar Shoot
//
//  Created by projet-L2R1 on 08/04/2019.
//  Copyright © 2019 projet-L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class Planet:SKSpriteNode {
    
    init(imageName: String){
        
        let texture = SKTexture(imageNamed : imageName)
        super.init(texture: texture, color: .clear, size: texture.size())
        
       /* self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2, center: self.anchorPoint) //planet.physicsBody = SKPhysicsBody(rectangleOf: planet.size) // déclaration du contouring de la planète, demandé au prof pour le typede SKphysics
        self.physicsBody!.affectedByGravity = false // on désactive la gravité pour la planète
        self.physicsBody!.categoryBitMask = GameScene.physicsCategories.planet
        self.physicsBody!.collisionBitMask = GameScene.physicsCategories.none
        self.physicsBody!.contactTestBitMask = GameScene.physicsCategories.asteroid*/
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func phys(){
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2, center: self.anchorPoint) //planet.physicsBody = SKPhysicsBody(rectangleOf: planet.size) // déclaration du contouring de la planète, demandé au prof pour le typede SKphysics
        self.physicsBody!.affectedByGravity = false // on désactive la gravité pour la planète
        self.physicsBody!.categoryBitMask = GameScene.physicsCategories.planet
        self.physicsBody!.collisionBitMask = GameScene.physicsCategories.none
        self.physicsBody!.contactTestBitMask = GameScene.physicsCategories.asteroid
        
    }
    
   func addPlanet(parent: GameScene) {
        self.setScale(0.55)
        self.position = CGPoint(x: parent.size.width / 2, y: -self.size.height)
        self.zPosition = 2
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        parent.addChild(self)
    }
    
}
