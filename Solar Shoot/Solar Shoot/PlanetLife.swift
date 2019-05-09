//
//  PlanetLife.swift
//  Solar Shoot
//
//  Created by lucas abijmil on 11/04/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
class PlanetLife : Planet{
    
    init(image:String){
        super.init(imageName : image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addPlanet(parent: GameScene) {
        self.setScale(0.15)
        self.position = CGPoint(x: parent.size.width * 0.78, y: parent.size.height + self.frame.size.height)
        self.zPosition = 100
        self.anchorPoint = CGPoint(x: 0.5, y: 0.25) // y = 0.25 sinon pas bien aligné en y
        parent.addChild(self)
    }
}
