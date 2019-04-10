//
//  ArtistsScene.swift
//  Solar Shoot
//
//  Created by lucas abijmil on 09/04/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ArtistsScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "Menu")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let artisticTeam = SKLabelNode(fontNamed: "Starjedi")
        artisticTeam.text = "Equipe Artistique"
        artisticTeam.fontSize = 80
        artisticTeam.fontColor = SKColor.white
        artisticTeam.position = CGPoint(x:self.size.width*0.5,y:self.size.height*0.8)
        artisticTeam.zPosition = 1
        self.addChild(artisticTeam)
        
        let name = SKLabelNode(fontNamed: "Starjedi")
        name.numberOfLines = 0
        name.text = "\t\t\t\t\t\t\tnpigossi\n\t\t\t\t\t\t\txanswer\n\t\t\t\t\tdavidmonje\naperturevintage\njspence5\nguillepozzi\nimfreejoe\nhossamgaucho"
        name.fontSize = 80
        name.fontColor = SKColor.white
        name.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.2)
        name.zPosition = 1
        self.addChild(name)
        
        
        
        
    }
}
