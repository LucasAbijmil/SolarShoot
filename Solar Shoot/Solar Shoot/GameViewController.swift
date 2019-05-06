//
//  GameViewController.swift
//  Solar Shoot V1
//
//  Created by Projet L2R1 on 19/02/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController { //La classe GameViewController hérité de UiViewController et aura une vue SKView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? { //as! permet de configurer la vue
            // déclaration de la variable en fonction de la scène
            let scene = MainmenuSolar (size: CGSize(width: 1535, height: 2048))
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
      
            view.presentScene(scene) //Permet de présenter la scène
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsPhysics = false
            view.showsNodeCount = false
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

