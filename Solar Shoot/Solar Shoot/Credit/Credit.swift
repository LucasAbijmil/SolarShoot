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
        
        let solarLabel = SKLabelNode(fontNamed :"Starjedi")
        solarLabel.text = "Solar"
        solarLabel.fontSize = 200
        solarLabel.fontColor = SKColor.white
        solarLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.8)
        solarLabel.zPosition = 1
        self.addChild(solarLabel)
        
        
        let shootLabel = SKLabelNode(fontNamed :"Starjedi")
        shootLabel.text = "Shoot"
        shootLabel.fontSize = 200
        shootLabel.fontColor = SKColor.white
        shootLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.7)
        shootLabel.zPosition = 1
        self.addChild(shootLabel)
        
        
        let teamLabel = SKLabelNode(fontNamed :"Starjedi")
        teamLabel.numberOfLines = 0
        teamLabel.text = "Équipe"
        teamLabel.fontSize = 100
        teamLabel.fontColor = SKColor.white
        teamLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.55)
        teamLabel.zPosition = 1
        teamLabel.name = "teamLabel"
        self.addChild(teamLabel)
        
        let technicLabel = SKLabelNode(fontNamed :"Starjedi")
        technicLabel.numberOfLines = 0
        technicLabel.text = "Technique"
        technicLabel.fontSize = 100
        technicLabel.fontColor = SKColor.white
        technicLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.50)
        technicLabel.zPosition = 1
        technicLabel.name = "technicLabel"
        self.addChild(technicLabel)
        
        let team2Label = SKLabelNode(fontNamed :"Starjedi")
        team2Label.numberOfLines = 0
        team2Label.text = "Équipe"
        team2Label.fontSize = 100
        team2Label.fontColor = SKColor.white
        team2Label.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.40)
        team2Label.zPosition = 1
        team2Label.name = "team2Label"
        self.addChild(team2Label)
        
        let artistsLabel = SKLabelNode(fontNamed :"Starjedi")
        artistsLabel.numberOfLines = 0
        artistsLabel.text = "Graphique"
        artistsLabel.fontSize = 100
        artistsLabel.fontColor = SKColor.white
        artistsLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.35)
        artistsLabel.zPosition = 1
        artistsLabel.name = "artistsLabel"
        self.addChild(artistsLabel)
        
        let thanksLabel = SKLabelNode(fontNamed: "Starjedi")
        thanksLabel.numberOfLines = 0
        thanksLabel.text = "Remerciements"
        thanksLabel.fontSize = 100
        thanksLabel.fontColor = SKColor.white
        thanksLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.25)
        thanksLabel.zPosition = 1
        thanksLabel.name = "thanksLabel"
        self.addChild(thanksLabel)
        
        
        let backLabel = SKLabelNode(fontNamed :"Starjedi")
        backLabel.text = "retour"
        backLabel.fontSize = 100
        backLabel.fontColor = SKColor.white
        backLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.15)
        backLabel.zPosition = 1
        backLabel.name = "backLabel"
        self.addChild(backLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            if (nodeTapped.name == "teamLabel" || nodeTapped.name == "technicLabel") {
                let scene = DevScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition: Transition)
            }
                
            else if (nodeTapped.name == "team2Label" || nodeTapped.name == "artistsLabel") {
                let scene = ArtistsScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition: Transition)
            }
            
            else if (nodeTapped.name == "thanksLabel") {
                let scene = ThanksScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition: Transition)
            }
            
            
            
            else if (nodeTapped.name  == "backLabel"){
                
                
                let scene = MainmenuSolar(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                //planet menu selection to create and place
                
                
            }
        }
    }
}

