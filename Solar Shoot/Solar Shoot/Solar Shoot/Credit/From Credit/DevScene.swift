//
//  DevScene.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 09/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import SafariServices
import GameplayKit

class DevScene: SKScene {
    
    private let background = SKSpriteNode(imageNamed: "Menu")
    private let teamLabel = SKLabelNode(fontNamed :"Starjedi")
    private let lucasLabel = SKLabelNode(fontNamed :"Starjedi")
    private let weredLabel = SKLabelNode(fontNamed :"Starjedi")
    private let hannaLabel = SKLabelNode(fontNamed :"Starjedi")
    private let dovrattLabel = SKLabelNode(fontNamed :"Starjedi")
    private let backLabel = SKLabelNode(fontNamed :"Starjedi")
    private let creditsLabel = SKLabelNode(fontNamed :"Starjedi")
    private let menuLabel = SKLabelNode(fontNamed :"Starjedi")
    private let principalLabel = SKLabelNode(fontNamed :"Starjedi")
    
    override init (size: CGSize) {
        super.init(size: size)
        print(musiqueActivee)
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
        
        //affichage du texte team
        //fadeIn(bouton: teamLabel, time: 1.5)
        affichageTexteFadeIn(bouton: teamLabel, text: "Team L2R1", fontS: 130, xW: 0.5, yH: 0.8, time: 1)
        
        
        //affichage du texte Shoot
        affichageTexteFadeIn(bouton: lucasLabel, text: "Lucas Abijmil", fontS: 90, xW: 0.5, yH: 0.7, time: 2.5)
        lucasLabel.name = "lucasLabel"
        
        //Declacartion et ajout du bouton jouer
        affichageTexteFadeIn(bouton: weredLabel, text: "Wered Achouche", fontS: 90, xW: 0.5, yH: 0.6, time: 2.5)
        weredLabel.name = "Wered Achouche"
        
        //Declacartion et ajout du bouton option
        affichageTexteFadeIn(bouton: hannaLabel, text: "Hanna Naccache", fontS: 90, xW: 0.5, yH: 0.5, time: 2.5)
        hannaLabel.name = "hannaLabel"
        
        //Declacartion et ajout du bouton crédit
        affichageTexteFadeIn(bouton: dovrattLabel, text: "Dovratt Bitan", fontS: 90, xW: 0.5, yH: 0.4, time: 2.5)
        dovrattLabel.name = "dovrattLabel"
        
        affichageTexteMoveY(bouton: backLabel, text: "Retour", fontS: 90, xW: 0.5, yH: -1.7, time: 4, yH2: 0.3)
        backLabel.name = "backLabel"
       
        
        affichageTexteMoveY(bouton: creditsLabel, text: "Crédits", fontS: 90, xW: 0.5, yH: -1.9, time: 4, yH2: 0.25)
        creditsLabel.name = "creditsLabel"
        
        affichageTexteMoveY(bouton: menuLabel, text: "Menu", fontS: 90, xW: 0.5, yH: -2.1, time: 4, yH2: 0.15)
        menuLabel.name = "menuLabel"
        
        affichageTexteMoveY(bouton: principalLabel, text: "Principal", fontS: 90, xW: 0.5, yH: -2.3, time: 4, yH2: 0.1)
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
            
            if (nodeTapped.name == "lucasLabel") {
                if let url = URL(string: "https://www.linkedin.com/in/lucas-abijmil-190b7715b/"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
                
            else if (nodeTapped.name == "weredLabel") {
                if let url = URL(string: "https://www.linkedin.com/in/wered-achouche-032209184/"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
                
            else if (nodeTapped.name == "hannaLabel") {
                if let url = URL(string: "https://www.linkedin.com/in/hanna-naccache-486b30181/"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
                
            else if (nodeTapped.name == "dovrattLabel") {
                if let url = URL(string: "https://www.linkedin.com/in/dovratt-bitan-78424a184/"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
                
                
                
            else if (nodeTapped.name == "backLabel" || nodeTapped.name == "creditsLabel") {
                transition(newScene: Credits(size: self.size))
            }
                
            else if (nodeTapped.name == "menuLabel" || nodeTapped.name == "principalLabel") {
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
}


