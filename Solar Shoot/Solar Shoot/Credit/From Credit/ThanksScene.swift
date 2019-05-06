//
//  ThanksScene.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 09/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ThanksScene: SKScene {
 
    private let background = SKSpriteNode(imageNamed: "Menu")
    private let FrankLabel = SKLabelNode(fontNamed :"Starjedi")
    private let DavidLabel = SKLabelNode(fontNamed :"Starjedi")
    private let menuLabel = SKLabelNode(fontNamed :"Starjedi")
    private let principalLabel = SKLabelNode(fontNamed :"Starjedi")
        
    override init (size: CGSize) {
        super.init(size: size)
        
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueOptionCredits")
        }
        else {
            musique.stopMusique(NameMusique: "MusiqueOptionCredits")
        }
        //affichage du fond d'écran
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        affichageTexteFadeIn(bouton: FrankLabel, text: "Frank Sauvage", fontS: 80, xW: 0.5, yH: 0.65, time: 2.5)
        
        affichageTexteFadeIn(bouton: DavidLabel, text: "David Janiszek", fontS: 80, xW: 0.5, yH: 0.55, time: 2.5)
        
        affichageTexteMoveY(bouton: menuLabel, text: "Menu", fontS: 90, xW: 0.5, yH: -2.1, time: 3, yH2: 0.10)
        menuLabel.name = "menuLabel"
        
        affichageTexteMoveY(bouton: principalLabel, text: "Principal", fontS: 90, xW: 0.5, yH: -2.3, time: 3, yH2: 0.05)
        principalLabel.name = "principalLabel"
        
    }
    required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
    }
            
    
    func affichageTexteFadeIn(bouton: SKLabelNode, text: String, fontS: Int, xW: CGFloat, yH: CGFloat, time: TimeInterval){
        bouton.text = text
        bouton.fontSize = CGFloat(fontS)
        bouton.fontColor = SKColor.white
        bouton.position = CGPoint(x:self.size.width*xW,y:self.size.height*yH)
        bouton.zPosition = 1
        bouton.alpha = 0
        self.addChild(bouton)
        let fadeIn = SKAction.fadeIn(withDuration: time)
        bouton.run(fadeIn)
    }
    
    func affichageTexteMoveY(bouton: SKLabelNode, text: String, fontS: Int, xW: CGFloat, yH: CGFloat, time: TimeInterval, yH2 : CGFloat) {
        bouton.text = text
        bouton.fontSize = CGFloat(fontS)
        bouton.fontColor = SKColor.white
        bouton.position = CGPoint(x: self.size.width*xW, y: self.size.height*yH)
        bouton.zPosition = 1
        self.addChild(bouton)
        let moveTo = SKAction.moveTo(y: self.size.height*yH2, duration: time)
        bouton.run(moveTo)
    }
    
    func transition(newScene: SKScene){
        let scene = newScene
        scene.scaleMode = self.scaleMode
        let Transition = SKTransition.reveal(with: .down, duration: 1.5)
        self.view!.presentScene(scene, transition:Transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
                
            if (nodeTapped.name == "menuLabel" || nodeTapped.name == "principalLabel") {
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
        
}
    
   

