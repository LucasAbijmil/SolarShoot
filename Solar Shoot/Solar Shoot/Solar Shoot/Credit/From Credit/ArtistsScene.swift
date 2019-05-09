//
//  ArtistsScene.swift
//  Solar Shoot
//
//  Created by Projet L2R1 on 09/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class ArtistsScene: SKScene {
    
    private let background = SKSpriteNode(imageNamed: "Menu")
    private let artisticTeamLabel = SKLabelNode(fontNamed :"Starjedi")
    private let graphismeLabel = SKLabelNode(fontNamed :"Starjedi")
    private let npigossiLabel = SKLabelNode(fontNamed :"Starjedi")
    private let xanswerLabel = SKLabelNode(fontNamed :"Starjedi")
    private let davidmonjeLabel = SKLabelNode(fontNamed :"Starjedi")
    private let aperturevintageLabel = SKLabelNode(fontNamed :"Starjedi")
    private let jspence5Label = SKLabelNode(fontNamed :"Starjedi")
    private let guillepozziLabel = SKLabelNode(fontNamed :"Starjedi")
    private let imfreejoeLabel = SKLabelNode(fontNamed :"Starjedi")
    private let hossamgauchoLabel = SKLabelNode(fontNamed :"Starjedi")
    private let backLabel = SKLabelNode(fontNamed :"Starjedi")
    private let creditsLabel = SKLabelNode(fontNamed :"Starjedi")
    private let menuLabel = SKLabelNode(fontNamed :"Starjedi")
    private let principalLabel = SKLabelNode(fontNamed :"Starjedi")
    
    
    override init (size: CGSize) {
        super.init(size: size)
        print(musiqueActivee)
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueOptionCredits")
        }
        else {
            musique.stopMusique(NameMusique: "MusiqueOptionCredits")
        }
        
        //affichage du fond d'écran
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        //affichage du texte team
        //fadeIn(bouton: teamLabel, time: 1.5)
        affichageTexteFadeIn(bouton: artisticTeamLabel, text: "Équipe Artistique", fontS: 80, xW: 0.5, yH: 0.9, time: 1.5)
        
        
        //affichage du texte Shoot
        affichageTexteFadeIn(bouton: graphismeLabel, text: "Graphisme par", fontS: 70, xW: 0.5, yH: 0.8, time: 2)
        
        
        //Declacartion et ajout du bouton jouer
        affichageTexteFadeIn(bouton: npigossiLabel, text: "NpigossiLabel", fontS: 80, xW: 0.5, yH: 0.7, time: 2.5)

        
        //Declacartion et ajout du bouton crédit
        affichageTexteFadeIn(bouton: xanswerLabel, text: "XanswerLabel", fontS: 80, xW: 0.5, yH: 0.65, time: 2.5)
        
        affichageTexteFadeIn(bouton: davidmonjeLabel, text: "Davidmonje", fontS: 80, xW: 0.5, yH: 0.6, time: 2.5)
        
        affichageTexteFadeIn(bouton: aperturevintageLabel, text: "AperturevintageL", fontS: 80, xW: 0.5, yH: 0.55, time: 2.5)
        
        affichageTexteFadeIn(bouton: jspence5Label, text: "Jspence5", fontS: 80, xW: 0.5, yH: 0.5, time: 2.5)
        
        affichageTexteFadeIn(bouton: guillepozziLabel, text: "Guillepozzi", fontS: 80, xW: 0.5, yH: 0.45, time: 2.5)
        
        affichageTexteFadeIn(bouton: imfreejoeLabel, text: "Imfreejoe", fontS: 80, xW: 0.5, yH: 0.4, time: 2.5)
        
        affichageTexteFadeIn(bouton: hossamgauchoLabel, text: "Hossamgaucho", fontS: 80, xW: 0.5, yH: 0.35, time: 2.5)
        
        affichageTexteFadeIn(bouton: hossamgauchoLabel, text: "Hossamgaucho", fontS: 80, xW: 0.5, yH: 0.35, time: 2.5)
        
        affichageTexteMoveY(bouton: backLabel, text: "Retour", fontS: 90, xW: 0.5, yH: -1.7, time: 3, yH2: 0.25)
        backLabel.name = "backLabel"
        
        
        affichageTexteMoveY(bouton: creditsLabel, text: "Crédits", fontS: 90, xW: 0.5, yH: -1.9, time: 3, yH2: 0.20)
        creditsLabel.name = "creditsLabel"
        
        affichageTexteMoveY(bouton: menuLabel, text: "Menu", fontS: 90, xW: 0.5, yH: -2.1, time: 3, yH2: 0.10)
        menuLabel.name = "menuLabel"
        
        affichageTexteMoveY(bouton: principalLabel, text: "Principal", fontS: 90, xW: 0.5, yH: -2.3, time: 3, yH2: 0.05)
        principalLabel.name = "principalLabel"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func affichageTexteFadeIn(bouton: SKLabelNode, text: String, fontS: Int, xW: CGFloat, yH: CGFloat, time: TimeInterval){
        bouton.text = text
        bouton.fontSize = CGFloat(fontS)
        bouton.fontColor = SKColor.white
        bouton.position = CGPoint(x:self.size.width*xW,y:self.size.height*yH)
        bouton.zPosition = 1
        bouton.alpha = 0
        self.addChild(bouton)
        let fadeIn = SKAction.fadeIn(withDuration: time)
        bouton.run(fadeIn)
    }
    
    func affichageTexteMoveY(bouton: SKLabelNode, text: String, fontS: Int, xW: CGFloat, yH: CGFloat, time: TimeInterval, yH2 : CGFloat) {
        bouton.text = text
        bouton.fontSize = CGFloat(fontS)
        bouton.fontColor = SKColor.white
        bouton.position = CGPoint(x: self.size.width*xW, y: self.size.height*yH)
        bouton.zPosition = 1
        self.addChild(bouton)
        let moveTo = SKAction.moveTo(y: self.size.height*yH2, duration: time)
        bouton.run(moveTo)
    }
    
    func transition(newScene: SKScene){
        let scene = newScene
        scene.scaleMode = self.scaleMode
        let Transition = SKTransition.reveal(with: .down, duration: 1.5)
        self.view!.presentScene(scene, transition:Transition)
    }
   
    
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            if (nodeTapped.name == "backLabel" || nodeTapped.name == "creditsLabel") {
               transition(newScene: Credits(size: self.size))
            }
                
            else if (nodeTapped.name == "menuLabel" || nodeTapped.name == "principalLabel") {
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
}

