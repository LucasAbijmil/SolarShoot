//
//  Planet.swift
//  Solar Shoot
//
//  Created by projet-L2R1 on 08/04/2019.
//  Copyright © 2019 projet-L2R1. All rights reserved.
//

//Classe qui permet d'afficher une planète différente à chaque niveau

import Foundation
import SpriteKit
import GameplayKit


class Planet:SKSpriteNode {
    
    //constructeur
    init(imageName: String){
        let texture = SKTexture(imageNamed : imageName)
        super.init(texture: texture, color: .clear, size: texture.size())
    }

        
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Le PhysicsBody de chaque planète
    func phys(){
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2, center: self.anchorPoint) // déclaration du contouring de la planète
        self.physicsBody!.affectedByGravity = false // on désactive la gravité pour la planète
        self.physicsBody!.categoryBitMask = GameScene.physicsCategories.planet
        self.physicsBody!.collisionBitMask = GameScene.physicsCategories.none
        self.physicsBody!.contactTestBitMask = GameScene.physicsCategories.asteroid
        
    }
    
    //Affichage 
   func addPlanet(parent: GameScene) {
        self.setScale(0.55)
        self.position = CGPoint(x: parent.size.width / 2, y: -self.size.height)
        self.zPosition = 2
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        parent.addChild(self)
    }
    
}
