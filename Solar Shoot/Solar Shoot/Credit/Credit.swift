//
//  Credits.swift
//  Solar Shoot
//
//  Created by Lucas Abijmil on 07/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Credits: SKScene {
   
    private let background = SKSpriteNode(imageNamed: "Menu")
    private let solarLabel = SKLabelNode(fontNamed :"Starjedi")
    private let shootLabel = SKLabelNode(fontNamed :"Starjedi")
    private let teamLabel = SKLabelNode(fontNamed :"Starjedi")
    private let technicLabel = SKLabelNode(fontNamed :"Starjedi")
    private let team2Label = SKLabelNode(fontNamed :"Starjedi")
    private let artistsLabel = SKLabelNode(fontNamed :"Starjedi")
    private let thanksLabel = SKLabelNode(fontNamed :"Starjedi")
    private let backLabel = SKLabelNode(fontNamed :"Starjedi")
    
    
    override init (size: CGSize) {
        super.init(size: size)
        print(musiqueActivee)
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique()
        }
        else {
            musique.stopMusique()
        }
        
        //affichage du fond d'écran
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        //affichage du texte Solar
        affichageTexte(bouton: solarLabel, text: "Solar", fontS: 200, xW: 0.5, yH: 0.8)
        
        //affichage du texte Shoot
        affichageTexte(bouton: shootLabel, text: "Shoot", fontS: 200, xW: 0.5, yH: 0.7)
        
        //Declacartion et ajout du bouton jouer
        affichageTexte(bouton: teamLabel, text: "Équipe", fontS: 100, xW: 0.5, yH: 0.55)
        teamLabel.name = "teamLabel"
        
        //Declacartion et ajout du bouton option
        affichageTexte(bouton: technicLabel, text: "Technique", fontS: 100, xW: 0.5, yH: 0.50)
        technicLabel.name = "technicLabel"
        
        //Declacartion et ajout du bouton crédit
        affichageTexte(bouton: team2Label, text: "Équipe", fontS: 100, xW: 0.5, yH: 0.4)
        team2Label.name = "team2Label"
        
        affichageTexte(bouton: artistsLabel, text: "Graphique", fontS: 100, xW: 0.5, yH: 0.35)
        artistsLabel.name = "artistsLabel"
        
        affichageTexte(bouton: thanksLabel, text: "Remerciements", fontS: 100, xW: 0.5, yH: 0.25)
        thanksLabel.name = "thanksLabel"
        
        affichageTexte(bouton: backLabel, text: "Retour", fontS: 100, xW: 0.5, yH: 0.15)
        backLabel.name = "backLabel"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func affichageTexte(bouton: SKLabelNode, text: String, fontS: Int, xW: CGFloat, yH: CGFloat){
        bouton.text = text
        bouton.fontSize = CGFloat(fontS)
        bouton.fontColor = SKColor.white
        bouton.position = CGPoint(x:self.size.width*xW,y:self.size.height*yH)
        bouton.zPosition = 1
        self.addChild(bouton)
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
            
            if (nodeTapped.name == "teamLabel" || nodeTapped.name == "technicLabel") {
               transition(newScene: DevScene(size: self.size))
            }
                
            else if (nodeTapped.name == "team2Label" || nodeTapped.name == "artistsLabel") {
                transition(newScene: ArtistsScene(size: self.size))
            }
            
            else if (nodeTapped.name == "thanksLabel") {
                transition(newScene: ThanksScene(size: self.size))
            }
            
            else if (nodeTapped.name  == "backLabel"){
                transition(newScene: MainmenuSolar(size: self.size))
                
            }
        }
    }
}

