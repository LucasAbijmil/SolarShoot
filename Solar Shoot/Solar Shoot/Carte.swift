//
//  Carte.swift
//  Solar Shoot V1
//
//  Created by Lucas Abijmil on 11/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics
import UIKit
class Carte:SKScene{
    override func didMove(to view: SKView) {
        
        
        
        let yourline = SKShapeNode()
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: CGPoint(x: self.size.width * 0.3 , y: self.size.height * 0.9))
        pathToDraw.addLine(to: CGPoint(x: self.size.width/2, y: self.size.height/1.22))
        pathToDraw.addLine(to: CGPoint(x: self.size.width/1.5, y: self.size.height/1.40))
        pathToDraw.addLine(to: CGPoint(x: self.size.width/1.5, y: self.size.height/1.80))
        pathToDraw.addLine(to: CGPoint(x: self.size.width*0.4, y: self.size.height/2.0))
        pathToDraw.addLine(to: CGPoint(x: self.size.width*0.3, y: self.size.height/2.80))
        pathToDraw.addLine(to: CGPoint(x: self.size.width*0.35, y: self.size.height/5.0))
        pathToDraw.addLine(to: CGPoint(x: self.size.width*0.7, y: self.size.height/6.30))
        
        yourline.path = pathToDraw
        yourline.strokeColor = SKColor.white
        yourline.lineWidth = 9
        addChild(yourline)
        
        
        
        
        let Carte = SKSpriteNode(imageNamed: "Carte")
        Carte.size = self.size
        Carte.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        Carte.zPosition = -1
        self.addChild(Carte)
        
        let neptune = SKSpriteNode(imageNamed: "Neptune")
        neptune.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        neptune.setScale(0.45)
        neptune.position = CGPoint(x: size.width * 0.3 , y: size.height * 0.9)
        neptune.zPosition = 2
        neptune.name = "bouton1"
        self.addChild(neptune)
        
        let uranus = SKSpriteNode(imageNamed: "Uranus")
        uranus.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        uranus.setScale(0.35)
        uranus.position = CGPoint(x: self.size.width/2, y: self.size.height/1.22)
        uranus.zPosition = 2
        uranus.name = "bouton1"
        self.addChild(uranus)
        
        let saturn = SKSpriteNode(imageNamed: "Saturne")
        saturn.anchorPoint = CGPoint(x: 0.55, y: 0.5)
        saturn.setScale(0.45)
        saturn.position = CGPoint(x:size.width/1.5, y: size.height/1.40)
        saturn.zPosition = 2
        saturn.name = "bouton1"
        self.addChild(saturn)
        
        let jupiter = SKSpriteNode(imageNamed: "Jupiter")
        jupiter.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        jupiter.setScale(0.35)
        jupiter.position = CGPoint(x: size.width/1.5, y: size.height/1.80)
        jupiter.zPosition = 2
        jupiter.name = "bouton1"
        self.addChild(jupiter)
        
        let mars = SKSpriteNode(imageNamed: "Mars")
        mars.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mars.setScale(0.35)
        mars.position = CGPoint(x: size.width*0.4, y: self.size.height/2.00)
        mars.zPosition = 2
        mars.name = "bouton1"
        self.addChild(mars)
        
        let hearth = SKSpriteNode(imageNamed: "Terre")
        hearth.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hearth.setScale(0.35)
        hearth.position = CGPoint(x: size.width*0.3, y: self.size.height/2.80)
        hearth.zPosition = 2
        hearth.name = "bouton1"
        self.addChild(hearth)
        
        let venus = SKSpriteNode(imageNamed: "Venus")
        venus.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        venus.setScale(0.35)
        venus.position = CGPoint(x: size.width*0.35, y: size.height/5.0)
        venus.zPosition = 2
        venus.name = "bouton1"
        self.addChild(venus)
        
        let mercury = SKSpriteNode(imageNamed: "Mercure")
        mercury.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mercury.setScale(0.45)
        mercury.position = CGPoint(x: size.width*0.7, y: size.height/6.30)
        mercury.zPosition = 2
        mercury.name = "bouton1"
        self.addChild(mercury)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        for touch: AnyObject in touches{
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            if (nodeTapped.name  == "bouton1"){
                
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                
                
            }
            
        }
    }
}
