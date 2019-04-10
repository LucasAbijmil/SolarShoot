//
//  Background.swift
//  Solar Shoot
//
//  Created by Hanna on 08/04/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Background {
    
    var playBackground = SKSpriteNode()
    
    
    init(imageName :String) {
        playBackground = SKSpriteNode(imageNamed: imageName)
        playBackground.zPosition = 0
        playBackground.name = "Background"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
       /* func scrolling (image:SKSpriteNode, parent: GameScene){
            for i in 0...1 {
                image.size = parent.size
                image.anchorPoint = CGPoint(x: 0.5, y: 0)
                image.position = CGPoint(x: parent.size.width / 2,
                                              y: parent.size.height * CGFloat(i))
                image.zPosition = 0
                image.name = "Background"
                parent.addChild(image)
                
            }
        }*/ // crée un thread
    
    
}


