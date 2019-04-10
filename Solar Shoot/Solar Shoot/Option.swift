//
//  Option.swift
//  Solar Shoot
//
//  Created by Lucas Abijmil on 07/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Option: SKScene {
    override func didMove(to view: SKView) {
        let option = SKSpriteNode(imageNamed: "Menu")
        option.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        option.zPosition = 0
        self.addChild(option)
        
        let solar = SKLabelNode(fontNamed :"Starjedi")
        solar.text = "Solar"
        solar.fontSize = 200
        solar.fontColor = SKColor.white
        solar.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.8)
        solar.zPosition = 1
        self.addChild(solar)
        
        
        let shoot = SKLabelNode(fontNamed :"Starjedi")
        shoot.text = "Shoot"
        shoot.fontSize = 200
        shoot.fontColor = SKColor.white
        shoot.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.7)
        shoot.zPosition = 1
        self.addChild(shoot)
        
        
        let son = SKLabelNode(fontNamed :"Starjedi")
        son.text = "son"
        son.fontSize = 100
        son.fontColor = SKColor.white
        son.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.5)
        son.zPosition = 1
        son.name = "bouton1"
        self.addChild(son)
        
        
        let musique = SKLabelNode(fontNamed :"Starjedi")
        musique.text = "musique"
        musique.fontSize = 100
        musique.fontColor = SKColor.white
        musique.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.4)
        musique.zPosition = 1
        musique.name = "bouton2"
        self.addChild(musique)
        
        
        let retour = SKLabelNode(fontNamed :"Starjedi")
        retour.text = "retour"
        retour.fontSize = 100
        retour.fontColor = SKColor.white
        retour.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.3)
        retour.zPosition = 1
        retour.name = "bouton3"
        self.addChild(retour)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            
            if (nodeTapped.name  == "bouton3"){
                
                
                let scene = MainmenuSolar(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                //planet menu selection to create and place
                
                
            }
        }
    }
}

