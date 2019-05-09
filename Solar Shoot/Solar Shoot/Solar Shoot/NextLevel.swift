//
//  NextLevel.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 16/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class NextLevel: SKScene {
    //constructeur
    
    override init (size: CGSize) {
        super.init(size: size)
        
        //A chaque niveau gagné on passe au niveau suivant
        switch lvlSelected {
        case 2 :
            lvlSelected+=1
            transition(newScene: Carte(size: self.size))
            break
        case 3 :
            lvlSelected+=1
            transition(newScene: Carte(size: self.size))
            break
        case 4 :
            lvlSelected+=1
           transition(newScene: Carte(size: self.size))
            break
        case 5 :
            lvlSelected+=1
           transition(newScene: Carte(size: self.size))
            break
        case 6 :
            lvlSelected+=1
           transition(newScene: Carte(size: self.size))
            break
        case 7 :
            lvlSelected+=1
            transition(newScene: Carte(size: self.size))
            break
        case 8 :
           transition(newScene: Carte(size: self.size))
            break
        default :
            transition(newScene: Carte(size: self.size))
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func transition(newScene: SKScene){
        let scene = newScene
        scene.scaleMode = self.scaleMode
        let Transition = SKTransition.reveal(with: .down, duration: 1.5)
        self.view!.presentScene(scene, transition:Transition)
    }
    
}
