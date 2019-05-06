//
//  Asteroid.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 08/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Asteroides:SKSpriteNode {
    
    //constructeur
    init(img:String){
        let texture = SKTexture(imageNamed: img)
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "Asteroid"
        self.setScale(0.2)
        self.zPosition = 2
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/3.3, center: self.anchorPoint)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.categoryBitMask = GameScene.physicsCategories.asteroid // Astéroid = 4 en binaire
        self.physicsBody!.collisionBitMask = GameScene.physicsCategories.none
        self.physicsBody!.contactTestBitMask  = GameScene.physicsCategories.planet | GameScene.physicsCategories.bullet
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF) //générer un nombre aléatoire
    }
    
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    //Ajouter des astéroides aléatoirement dans la GameScene
    func addAsteroid (parent: GameScene)  {
        
        let randomStart1 = random(min: self.size.height/2, max: parent.size.height - self.size.height/2)
        let startPoint1 =  CGPoint(x:randomStart1 , y:parent.size.width + self.size.width/2 )
        let endPoint1   =  CGPoint(x: randomStart1, y: -self.size.width/2)
        
        self.position = startPoint1
        parent.addChild(self)
        
        let moveAsteroid = SKAction.move(to: endPoint1 , duration: 3.5)
        let deleteAsteroide = SKAction.removeFromParent()
        let asteroidSeq = SKAction.sequence([moveAsteroid,deleteAsteroide])
        
        self.run(SKAction.repeatForever(asteroidSeq))
        
       
    }
    
    
    
    
}
