//
//  Carte.swift
//  Solar Shoot V1
//
//  Created by wered achouche on 11/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics
import UIKit

var lvlSelected : Int = 0

class Carte:SKScene{
    override func didMove(to view: SKView) {
        
        
        let yourline = SKShapeNode()
        let pathToDraw = CGMutablePath()
        
        
        pathToDraw.move(to: CGPoint(x: self.size.width * 0.3 , y: self.size.height * 0.9)) // Ligne 1 à modif ––> faire passer en pathToDraw.addQuadCurve
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width/2, y: self.size.height/1.22), control: CGPoint(x:size.width*0.4, y:size.height*0.99))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width/1.5, y: self.size.height/1.40),control: CGPoint(x:size.width*0.75, y:size.height*0.8))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width/1.5, y: self.size.height/1.80),control: CGPoint(x:size.width*0.75, y:size.height*0.65))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.4, y: self.size.height/2.0),control: CGPoint(x:size.width*0.4, y:size.height*0.65))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.6, y: self.size.height/2.80),control: CGPoint(x:size.width*0.5, y:size.height*0.4))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.35, y: self.size.height/5.0),control: CGPoint(x:size.width*0.4, y:size.height*0.4))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.7, y: self.size.height/6.30),control: CGPoint(x:size.width*0.4, y:size.height/10.5))
        // Ligne 2 à modif ––> faire passer en pathToDraw (là ou vont commncer les courbes
        
        
        yourline.path = pathToDraw
        yourline.fillColor = .clear
        yourline.glowWidth = 6
        yourline.alpha = 0.8
        yourline.strokeColor = SKColor.white
        yourline.lineWidth = 9
        addChild(yourline)
        
        
        
        
        
        
        let Carte = SKSpriteNode(imageNamed: "Carte")
        Carte.size = self.size
        Carte.position = CGPoint(x: self.size.width/2, y:self.size.height/2)
        Carte.zPosition = -1
        self.addChild(Carte)
        
        
        
        if lvlNumber >= 1 {
            let mercury = SKSpriteNode(imageNamed: "Mercure")
            mercury.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            //   mercury.size.width = UIScreen.main.bounds.size.width/1.8
            //   mercury.size.height=UIScreen.main.bounds.size.height/3.0
            mercury.setScale(0.45)
            mercury.position = CGPoint(x: self.size.width*0.7, y: self.size.height/6.30)
            mercury.zPosition = 2
            mercury.name = "lvl1"
            self.addChild(mercury)
            
            if lvlNumber >= 2{
                let venus = SKSpriteNode(imageNamed: "Venus")
                venus.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                //   venus.size.width = UIScreen.main.bounds.size.width/1.8
                //   venus.size.height = UIScreen.main.bounds.size.height/3.0
                venus.setScale(0.35)
                venus.position = CGPoint(x: self.size.width*0.35, y: self.size.height/5.0)
                venus.zPosition = 2
                venus.name = "lvl2"
                self.addChild(venus)
                
                if lvlNumber >= 3 {
                    let hearth = SKSpriteNode(imageNamed: "Terre")
                    hearth.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                    //   hearth.size.width = UIScreen.main.bounds.size.width/1.8
                    //   hearth.size.height = UIScreen.main.bounds.size.height/3.0
                    hearth.setScale(0.35)
                    hearth.position = CGPoint(x: self.size.width*0.6, y: self.size.height/2.80)
                    hearth.zPosition = 2
                    hearth.name = "lvl3"
                    self.addChild(hearth)
                    
                    if lvlNumber >= 4 {
                        let mars = SKSpriteNode(imageNamed: "Mars")
                        mars.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                        //   mars.size.width = UIScreen.main.bounds.size.width/1.8
                        //  mars.size.height = UIScreen.main.bounds.size.height/3.0
                        mars.setScale(0.35)
                        mars.position = CGPoint(x: self.size.width*0.4, y: self.size.height/2.0)
                        mars.zPosition = 2
                        mars.name = "lvl4"
                        self.addChild(mars)
                        
                        if lvlNumber >= 5 {
                            let jupiter = SKSpriteNode(imageNamed: "Jupiter")
                            jupiter.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                            //  jupiter.size.width = UIScreen.main.bounds.size.width/1.8
                            //  jupiter.size.height = UIScreen.main.bounds.size.height/3.0
                            jupiter.setScale(0.35)
                            jupiter.position = CGPoint(x: self.size.width/1.5, y: self.size.height/1.80)
                            jupiter.zPosition = 2
                            jupiter.name = "lvl5"
                            self.addChild(jupiter)
                            
                            if lvlNumber >= 6 {
                                let saturn = SKSpriteNode(imageNamed: "Saturne")
                                saturn.anchorPoint = CGPoint(x: 0.55, y: 0.5)
                                // saturn.size.width=UIScreen.main.bounds.size.width/1.8
                                // saturn.size.height = UIScreen.main.bounds.size.height/3.0
                                saturn.setScale(0.45) //définir l'échelle
                                saturn.position = CGPoint(x: self.size.width/1.5, y: self.size.height/1.40)
                                saturn.zPosition = 2
                                saturn.name = "lvl6"
                                self.addChild(saturn)
                                
                                if lvlNumber >= 7 {
                                    let uranus = SKSpriteNode(imageNamed: "Uranus")
                                    uranus.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                                    //  uranus.size.width=UIScreen.main.bounds.size.width/1.8
                                    //  uranus.size.height = UIScreen.main.bounds.size.height/3.0
                                    
                                    
                                    uranus.setScale(0.35)
                                    uranus.position = CGPoint(x: self.size.width/2, y: self.size.height/1.22)
                                    uranus.zPosition = 2
                                    uranus.name = "lvl7"
                                    self.addChild(uranus)
                                    
                                    if lvlNumber >= 8 {
                                        let neptune = SKSpriteNode(imageNamed: "Neptune")
                                        neptune.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                                        //   neptune.size.width=UIScreen.main.bounds.size.width/1.8
                                        // neptune.size.height=UIScreen.main.bounds.size.height/3.0
                                        neptune.setScale(0.45)
                                        neptune.position = CGPoint(x: self.size.width * 0.3 , y: self.size.height * 0.9)
                                        neptune.zPosition = 2
                                        neptune.name = "lvl8"
                                        self.addChild(neptune)
                                        //  if (lvlNumber < 7) {
                                        //       neptune.color = .darkGray
                                        //   }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
            
       
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            
            if (nodeTapped.name  == "lvl1") {
                
                lvlSelected = 1
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
                
            }
                
            else if (nodeTapped.name == "lvl2") {
                lvlSelected = 2
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            else if (nodeTapped.name == "lvl3") {
                lvlSelected = 3
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            else if (nodeTapped.name == "lvl4") {
                lvlSelected = 4
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            else if (nodeTapped.name == "lvl5") {
                lvlSelected = 5
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            else if (nodeTapped.name == "lvl6") {
                lvlSelected = 6
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            else if (nodeTapped.name == "lvl7") {
                lvlSelected = 7
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            else if (nodeTapped.name == "lvl8") {
                lvlSelected = 8
                let scene = GameScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
            
            
        }
        
        
    }
}
