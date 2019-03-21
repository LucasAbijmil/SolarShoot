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
        
        let Name = SKLabelNode(fontNamed :"Starjedi")
        Name.text = "Solar"
        Name.fontSize = 200
        Name.fontColor = SKColor.white
        Name.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.8)
        Name.zPosition = 1
        self.addChild(Name)
        
        
        let Name1 = SKLabelNode(fontNamed :"Starjedi")
        Name1.text = "Shoot"
        Name1.fontSize = 200
        Name1.fontColor = SKColor.white
        Name1.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.7)
        Name1.zPosition = 1
        self.addChild(Name1)
        
        
        let Bouton1 = SKLabelNode(fontNamed :"Starjedi")
        Bouton1.text = "jouer"
        Bouton1.fontSize = 100
        Bouton1.fontColor = SKColor.white
        Bouton1.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.5)
        Bouton1.zPosition = 1
        Bouton1.name = "bouton1"
        self.addChild(Bouton1)
        
        
        let Bouton2 = SKLabelNode(fontNamed :"Starjedi")
        Bouton2.text = "options"
        Bouton2.fontSize = 100
        Bouton2.fontColor = SKColor.white
        Bouton2.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.4)
        Bouton2.zPosition = 1
        Bouton2.name = "bouton2"
        self.addChild(Bouton2)
        
        
        let Bouton3 = SKLabelNode(fontNamed :"Starjedi")
        Bouton3.text = "crédits"
        Bouton3.fontSize = 100
        Bouton3.fontColor = SKColor.white
        Bouton3.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.3)
        Bouton3.zPosition = 1
        Bouton3.name = "bouton3"
        self.addChild(Bouton3)
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

