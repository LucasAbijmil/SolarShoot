//
//  ThanksScene.swift
//  Solar Shoot
//
//  Created by lucas abijmil on 09/04/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ThanksScene: SKScene {
    override func didMove(to view: SKView) {
        let option = SKSpriteNode(imageNamed: "Menu")
        option.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        option.zPosition = 0
        self.addChild(option)
        
        
    }
}
