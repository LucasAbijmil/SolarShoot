//
//  Label.swift
//  Solar Shoot
//
//  Created by Hanna on 10/04/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
class Label{
    
    public var gameScoreLabel = SKLabelNode(fontNamed: "Starjedi")
    public let planetLife = SKSpriteNode(imageNamed: "Planet")
    public var pointLifeLabel = SKLabelNode(fontNamed: "Starjedi")
    public var xPointLifeLabel = SKLabelNode(fontNamed: "Starjedi")
    public let tapToBeginLabel = SKLabelNode(fontNamed: "Starjedi")
    
    func afficherPlanet(parent: GameScene,planet:Planet,planetIcon:PlanetLife){
        parent.planet = planet
        planet.addPlanet(parent: parent)
        planet.phys()
        parent.planetIcon = planetIcon
        planetIcon.addPlanet(parent: parent)
    }
    
    
    func AffichageLabel(label:SKLabelNode,text:String,fontS:Int,horAlign:SKLabelHorizontalAlignmentMode,xW: CGFloat,parent:GameScene){
        
        label.text = text
        label.fontSize = CGFloat(fontS)
        label.fontColor = SKColor.white
        label.horizontalAlignmentMode = horAlign
        label.position = CGPoint(x:parent.size.width*xW, y:parent.size.height+label.frame.size.height)
        label.zPosition=100
        parent.addChild(label)
    }
    
    func phrasePreGame(parent:GameScene,label:SKLabelNode){
        tapToBeginLabel.text = "Appuyez pour commencer votre mission"
        tapToBeginLabel.fontSize = 80
        tapToBeginLabel.fontColor = SKColor.white
        tapToBeginLabel.zPosition = 1
        tapToBeginLabel.alpha = 0.7
        tapToBeginLabel.position = CGPoint(x: parent.size.width*1.5, y: parent.size.height/2)
        parent.addChild(tapToBeginLabel)
    }
    
    func LifeMultip(){
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let changeColor = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1, duration: 0)
        let returnColor = SKAction.colorize(with: UIColor.white, colorBlendFactor: 1, duration: 0)
        let scaleSequence = SKAction.sequence([changeColor, scaleUp, scaleDown, returnColor])
        let scaleUp2 = SKAction.scale(to: 1.1, duration : 0.2)
        let scaleDown2 = SKAction.scale(to: 1, duration: 0.2)
        let changeColor2 = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1, duration: 0)
        let returnColor2 = SKAction.colorize(with: UIColor.white, colorBlendFactor: 1, duration: 0)
        let scaleSequence2 = SKAction.sequence([changeColor2, scaleUp2, scaleDown2, returnColor2])
        pointLifeLabel.run(scaleSequence)
        xPointLifeLabel.run(scaleSequence2)
    }
}
