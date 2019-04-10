//
//  DevScene.swift
//  Solar Shoot
//
//  Created by lucas abijmil on 09/04/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import SafariServices
import GameplayKit

class DevScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "Menu")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let teamLabel = SKLabelNode(fontNamed: "Starjedi")
        teamLabel.text = "Team L2R1"
        teamLabel.fontSize = 130
        teamLabel.fontColor = SKColor.white
        teamLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height)
        teamLabel.zPosition = 1
        self.addChild(teamLabel)
        let scrollTeamLabelTop = SKAction.moveTo(y: self.size.height*0.8, duration: 2.5)
        teamLabel.run(scrollTeamLabelTop)
        
        let lucasLabel = SKLabelNode(fontNamed: "Starjedi")
        lucasLabel.text = "Lucas Abijmil"
        lucasLabel.fontSize = 90
        lucasLabel.fontColor = SKColor.white
        lucasLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*0.9)
        lucasLabel.zPosition = 1
        lucasLabel.name = "lucasLabel"
        self.addChild(lucasLabel)
        let scrollLucasLabelTop = SKAction.moveTo(y: self.size.height*0.7, duration: 3)
        lucasLabel.run(scrollLucasLabelTop)
        
        let weredLabel = SKLabelNode(fontNamed: "Starjedi")
        weredLabel.text = "Wered Achouche"
        weredLabel.fontSize = 90
        weredLabel.fontColor = SKColor.white
        weredLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*1.1)
        weredLabel.zPosition = 1
        weredLabel.name = "weredLabel"
        self.addChild(weredLabel)
        let scrollWeredLabelTop = SKAction.moveTo(y: self.size.height*0.6, duration: 3)
        weredLabel.run(scrollWeredLabelTop)
        
        let hannaLabel = SKLabelNode(fontNamed: "Starjedi")
        hannaLabel.text = "Hanna Naccache"
        hannaLabel.fontSize = 90
        hannaLabel.fontColor = SKColor.white
        hannaLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*1.3)
        hannaLabel.zPosition = 1
        hannaLabel.name = "hannaLabel"
        self.addChild(hannaLabel)
        let scrollhannaLabelTop = SKAction.moveTo(y: self.size.height*0.5, duration: 3)
        hannaLabel.run(scrollhannaLabelTop)
        
        let dovrattLabel = SKLabelNode(fontNamed: "Starjedi")
        dovrattLabel.text = "Dovratt Bitan"
        dovrattLabel.fontSize = 90
        dovrattLabel.fontColor = SKColor.white
        dovrattLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*1.5)
        dovrattLabel.zPosition = 1
        dovrattLabel.name = "dovrattLabel"
        self.addChild(dovrattLabel)
        let scrolldovrattLabelTop = SKAction.moveTo(y: self.size.height*0.4, duration: 3)
        dovrattLabel.run(scrolldovrattLabelTop)
        
        let backLabel = SKLabelNode(fontNamed :"Starjedi")
        backLabel.numberOfLines = 0
        backLabel.text = "Retour"
        backLabel.fontSize = 90
        backLabel.fontColor = SKColor.white
        backLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*1.7)
        backLabel.zPosition = 1
        backLabel.name = "backLabel"
        self.addChild(backLabel)
        let scrollBacklabelToTop = SKAction.moveTo(y: self.size.height*0.3, duration: 4.5)
        backLabel.run(scrollBacklabelToTop)
        
        let creditsLabel = SKLabelNode(fontNamed :"Starjedi")
        creditsLabel.numberOfLines = 0
        creditsLabel.text = "Crédits"
        creditsLabel.fontSize = 90
        creditsLabel.fontColor = SKColor.white
        creditsLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*1.9)
        creditsLabel.zPosition = 1
        creditsLabel.name = "creditsLabel"
        self.addChild(creditsLabel)
        let scrollCreditslabelToTop = SKAction.moveTo(y: self.size.height*0.25, duration: 4.5)
        creditsLabel.run(scrollCreditslabelToTop)

        let menuLabel = SKLabelNode(fontNamed :"Starjedi")
        menuLabel.numberOfLines = 0
        menuLabel.text = "Menu"
        menuLabel.fontSize = 90
        menuLabel.fontColor = SKColor.white
        menuLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*2.1)
        menuLabel.zPosition = 1
        menuLabel.name = "menuLabel"
        self.addChild(menuLabel)
        let scrollMenulabelToTop = SKAction.moveTo(y: self.size.height*0.15, duration: 4.5)
        menuLabel.run(scrollMenulabelToTop)
        
        let princiaplLabel = SKLabelNode(fontNamed :"Starjedi")
        princiaplLabel.numberOfLines = 0
        princiaplLabel.text = "Principal"
        princiaplLabel.fontSize = 90
        princiaplLabel.fontColor = SKColor.white
        princiaplLabel.position = CGPoint(x:self.size.width*0.5,y:-self.size.height*2.3)
        princiaplLabel.zPosition = 1
        princiaplLabel.name = "princiaplLabel"
        self.addChild(princiaplLabel)
        let scrollPrincipallabelToTop = SKAction.moveTo(y: self.size.height*0.10, duration: 4.5)
        princiaplLabel.run(scrollPrincipallabelToTop)
        
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
                let scene = Credits(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition: Transition)
            }
            
            else if (nodeTapped.name == "menuLabel" || nodeTapped.name == "princiaplLabel") {
                let scene = MainmenuSolar(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition: Transition)
            }
        }
    }
}

