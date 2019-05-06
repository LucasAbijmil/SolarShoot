//
//  Sons.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 17/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var sonsActivee = true

class Sons {
    
    //attributs
    public let bulletSound: SKAction
    public let explosionSound :SKAction
    public var sonsActivee : Bool

    init(sonsActivee: Bool){
         bulletSound = SKAction.playSoundFileNamed("Bulletsong.mp3", waitForCompletion: false)
        explosionSound = SKAction.playSoundFileNamed("Explosionsong.mp3", waitForCompletion: false)
        self.sonsActivee = sonsActivee
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Récuperer le son du missile
    public func getBulletSound() -> SKAction{
        return bulletSound
    }
    
    //Récuperer le son de l'explosion
    public func getExplosionSound() -> SKAction{
        return explosionSound
    }
    
    //Renvoie vrai si le son est activé et faux sinon
    public func getSonsActivee() -> Bool{
        return sonsActivee
    }
    
    //Modifie la valeur du sonActivee par la valeur entrée en paramètre
    public func setSonsActivee(valeur: Bool) {
        sonsActivee = valeur
    }
}
