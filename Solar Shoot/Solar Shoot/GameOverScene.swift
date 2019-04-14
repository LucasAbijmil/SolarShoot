//
//  EndScene.swift
//  Solar Shoot
//
//  Created by Lucas Abijmil on 07/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
extension Formatter {
    static let WithSeparatorGameOverScene: NumberFormatter = {
        let spaceScore = NumberFormatter()
        spaceScore.groupingSeparator = " "
        spaceScore.numberStyle = .decimal
        return spaceScore
    } ()
}
extension BinaryInteger {
    var formattedWithSeparatorGameOverScene: String {
        return Formatter.WithSeparatorGameOverScene.string(for: self) ?? ""
    }
}
class GameOverScene : SKScene {
    override func didMove(to view: SKView) {
        
        let endScene = SKSpriteNode(imageNamed: "Menu")
        endScene.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        endScene.zPosition = 0
        self.addChild(endScene)
        
        let Name = SKLabelNode(fontNamed :"Starjedi")
        Name.text = "game over"
        Name.fontSize = 140
        Name.fontColor = SKColor.white
        Name.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.8)
        Name.zPosition = 1
        self.addChild(Name)
        
        let scoreLabel = SKLabelNode(fontNamed: "Starjedi")
        scoreLabel.text = "Score : \(gameScore.formattedWithSeparatorGameOverScene )"
        scoreLabel.fontSize = 100
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width*0.5 , y: self.size.height*0.6)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if(gameScore > highScoreNumber) {
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey:"highScoreSaved")
        }
        
        
        
        let hightScoreLabel = SKLabelNode(fontNamed :"Starjedi")
        let hightScoreString = highScoreNumber.formattedWithSeparatorGameOverScene
        hightScoreLabel.text = "Meilleur score : \(hightScoreString)"
        hightScoreLabel.fontSize = 60
        hightScoreLabel.fontColor = SKColor.white
        hightScoreLabel.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.5)
        hightScoreLabel.zPosition = 1
        self.addChild(hightScoreLabel)
        
        
        let Bouton = SKLabelNode(fontNamed :"Starjedi")
        Bouton.text = "Rejouer"
        Bouton.fontSize = 100
        Bouton.fontColor = SKColor.white
        Bouton.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.4)
        Bouton.zPosition = 1
        Bouton.name = "bouton"
        self.addChild(Bouton)
        
        let Bouton1 = SKLabelNode(fontNamed :"Starjedi")
        Bouton1.text = "Menu"
        Bouton1.fontSize = 100
        Bouton1.fontColor = SKColor.white
        Bouton1.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.3)
        Bouton1.zPosition = 1
        Bouton1.name = "bouton1"
        self.addChild(Bouton1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            
            if (nodeTapped.name  == "bouton"){
                
                
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                //planet menu selection to create and place
                
            }
            if (nodeTapped.name  == "bouton1"){
                
                
                let scene = MainmenuSolar(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
        }
    }
}

