//
//  Credits.swift
//  Solar Shoot
//
//  Created by Lucas Abijmil on 07/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Credits: SKScene {
    override func didMove(to view: SKView) {
        let option = SKSpriteNode(imageNamed: "Menu")
        option.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        option.zPosition = 0
        self.addChild(option)
        
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
        
        
        let Texte = SKLabelNode(fontNamed :"Starjedi")
        Texte.text = "réalisé par"
        Texte.fontSize = 100
        Texte.fontColor = SKColor.white
        Texte.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.6)
        Texte.zPosition = 1
        self.addChild(Texte)
        
        let Texte2 = SKLabelNode(fontNamed :"Starjedi")
        Texte2.text = "Lucas Abijmil"
        Texte2.fontSize = 100
        Texte2.fontColor = SKColor.white
        Texte2.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.5)
        Texte2.zPosition = 1
        self.addChild(Texte2)
        
        let Texte4 = SKLabelNode(fontNamed :"Starjedi")
        Texte4.text = "Wered Achouche"
        Texte4.fontSize = 100
        Texte4.fontColor = SKColor.white
        Texte4.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.4)
        Texte4.zPosition = 1
        self.addChild(Texte4)
        
        
        let Texte6 = SKLabelNode(fontNamed :"Starjedi")
        Texte6.text = "Dovratt Bitan et"
        Texte6.fontSize = 100
        Texte6.fontColor = SKColor.white
        Texte6.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.3)
        Texte6.zPosition = 1
        self.addChild(Texte6)
        
        
        let Texte9 = SKLabelNode(fontNamed :"Starjedi")
        Texte9.text = "Hanna Naccache"
        Texte9.fontSize = 100
        Texte9.fontColor = SKColor.white
        Texte9.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.2)
        Texte9.zPosition = 1
        self.addChild(Texte9)
        
        
        /*let Bouton2 = SKLabelNode(fontNamed :"Starjedi")
         Bouton2.text = "musique"
         Bouton2.fontSize = 100
         Bouton2.fontColor = SKColor.white
         Bouton2.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.4)
         Bouton2.zPosition = 1
         Bouton2.name = "bouton2"
         self.addChild(Bouton2)
         */
        
        let Bouton3 = SKLabelNode(fontNamed :"Starjedi")
        Bouton3.text = "retour"
        Bouton3.fontSize = 100
        Bouton3.fontColor = SKColor.white
        Bouton3.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.1)
        Bouton3.zPosition = 1
        Bouton3.name = "bouton3"
        self.addChild(Bouton3)
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

