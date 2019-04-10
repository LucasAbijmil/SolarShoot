//
//  MainMenu.swift
//  Solar Shoot V1
//
//  Created by Lucas Abijmil on 19/02/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
class MainmenuSolar:SKScene{
    override func didMove(to view: SKView) {
        
        let menu = SKSpriteNode(imageNamed: "Menu")
        menu.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        menu.zPosition = 0
        self.addChild(menu)
        
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
        
        
        let play = SKLabelNode(fontNamed :"Starjedi")
        play.text = "jouer"
        play.fontSize = 100
        play.fontColor = SKColor.white
        play.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.5)
        play.zPosition = 1
        play.name = "bouton1"
        self.addChild(play)
        
        
        let options = SKLabelNode(fontNamed :"Starjedi")
        options.text = "options"
        options.fontSize = 100
        options.fontColor = SKColor.white
        options.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.4)
        options.zPosition = 1
        options.name = "bouton2"
        self.addChild(options)
        
        
        let credits = SKLabelNode(fontNamed :"Starjedi")
        credits.text = "crédits"
        credits.fontSize = 100
        credits.fontColor = SKColor.white
        credits.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.3)
        credits.zPosition = 1
        credits.name = "bouton3"
        self.addChild(credits)
    }
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            
            if (nodeTapped.name  == "bouton1"){
                
                
                let scene = Carte(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                //planet menu selection to create and place
                
                
            }
            
            //si on tape sur sur Option (bouton2) une autre scene apparait
            if (nodeTapped.name  == "bouton2"){
                
                let scene = Option(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                //planet menu selection to create and place
                
            }
            
            //si on tape sur sur Credits (bouton3) une autre scene apparait
            if (nodeTapped.name  == "bouton3"){
                
                let scene = Credits(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                //planet menu selection to create and place
                
            }
            
        }
    }
    
    
}

