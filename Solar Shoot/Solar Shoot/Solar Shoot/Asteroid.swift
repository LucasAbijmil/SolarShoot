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

class Asteroide {
    
    var asteroid = SKSpriteNode()
    
    enum gameState { // Permet de dire dans quel état est le jeu
        case preGame // avant le début du niveau
        case inGame // pendant le niveau
        case StopedGame // si le joueur fait pause
        case afterGame // après le niveau ––> gagné ou perdu
    }
    var currentGameState = gameState.preGame //Ici on indique on fixe la valeur à inGame ; int = confusion
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF) //générer un nombre aléatoire
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    //Fait tomber des astéroides aléatoirement dans la GameScene
    func addAsteroid (imageName: String, parent: GameScene)  {
        let gameArea : CGRect
        let maxRatioAspect: CGFloat =  16.0 / 9.0
        let widthPlayable = parent.size.height / maxRatioAspect
        let widthMargin =  (parent.size.width - widthPlayable) / 2
        let heightPlayable = parent.size.width / maxRatioAspect
        let heightMargin = (parent.size.height - heightPlayable) / 1000
        gameArea = CGRect(x: widthMargin, y: heightMargin, width: widthPlayable, height: heightPlayable)
        
        let randomStart = random(min:gameArea.minX, max:gameArea.maxX)
        let randomEnd = random(min:gameArea.minX, max:gameArea.maxX)
        
        //Point de départ des astéroïdes
        let start = CGPoint(x: randomStart, y: parent.size.height * 1.2)
        
        //Point de disparition des astéroïdes
        let end = CGPoint(x: randomEnd, y: -parent.size.height * 0.2)
        
        
        //Caractéristiques de l'astéroïde
        let asteroid = SKSpriteNode(imageNamed : imageName)
        asteroid.name = "Asteroid"
        asteroid.position = start
        asteroid.setScale(0.2)
        asteroid.zPosition = 2
        asteroid.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        asteroid.physicsBody = SKPhysicsBody(circleOfRadius: asteroid.size.width/3.3, center: asteroid.anchorPoint)
        asteroid.physicsBody!.affectedByGravity = false
        asteroid.physicsBody!.categoryBitMask = GameScene.physicsCategories.asteroid // Astéroid = 4 en binaire
        asteroid.physicsBody!.collisionBitMask = GameScene.physicsCategories.none
        asteroid.physicsBody!.contactTestBitMask  = GameScene.physicsCategories.planet | GameScene.physicsCategories.bullet
        
        //Affichage de l'astéroide
        parent.addChild(asteroid)
        
        //répétition de la séquence de tomber des astéroïdes et leur disparition
        let moveAsteroid = SKAction.move(to: end, duration: 2.5)
        let deleteAsteroid = SKAction.removeFromParent()
        let asteroidSeq = SKAction.sequence([moveAsteroid,deleteAsteroid])
        asteroid.run(SKAction.repeatForever(asteroidSeq))
        
        //Rotations des astéroïdes
        let oneRevolution = SKAction.rotate(byAngle: CGFloat.pi / 4, duration: 0.1)
        let repeatRevolution = SKAction.repeatForever(oneRevolution)
        
        //pas obligatoire, mais si mauvais timing le jeu freeze
        if currentGameState == gameState.inGame {
            asteroid.run(asteroidSeq)
            asteroid.run(repeatRevolution)
        }
    }
    
}
