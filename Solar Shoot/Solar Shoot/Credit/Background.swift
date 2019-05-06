//
//  Background.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 08/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

//Classe pour afficher un fond d'écran différents à chaque niveau

import Foundation
import SpriteKit
import GameplayKit

class Background {
    
    var playBackground = SKSpriteNode()
    
    //constructeur
    init(imageName :String) {
        playBackground = SKSpriteNode(imageNamed: imageName)
        playBackground.zPosition = 0
        playBackground.name = "Background"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Affichage
    func jeuBackground (parent : GameScene){
        playBackground.size = parent.size
        playBackground.position = CGPoint(x: parent.size.width / 2, y: parent.size.height / 2)
        parent.addChild(playBackground)
        for i in 0...1 {
         playBackground.anchorPoint = CGPoint(x: 0.5, y: 0)
         playBackground.position = CGPoint(x: parent.size.width / 2,
         y: parent.size.height * CGFloat(i))
         }
    }
    
}


