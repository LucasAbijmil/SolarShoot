//
//  Option.swift
//  shooter
//
//  Created by Mehir bitan on 03/04/2019.
//  Copyright © 2019 Dovratt bitan. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

class Option: SKScene {
    
    //attributs déclaration des variables
    let option = SKSpriteNode(imageNamed: "Menu")
    let Name = SKLabelNode(fontNamed :"Starjedi")
    let Name1 = SKLabelNode(fontNamed :"Starjedi")
    let Bouton1 = SKLabelNode(fontNamed :"Starjedi")
    let Bouton2 = SKLabelNode(fontNamed :"Starjedi")
    let Bouton3 = SKLabelNode(fontNamed :"Starjedi")
    //let musique = Music(musiqueActivee: musiqueActivee )
    
    //constructeur
    override init (size: CGSize) {
        super.init(size: size)
        print(musiqueActivee)
        //Permet d'avoir la musique sans appuyer sur le bouton musique si à la base la musique était déjà activée
        if(musique.getMusiqueActivee()){
            musique.playMusique()
        }
        
        //affichage du fond d'écran
        option.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        option.zPosition = 0
        self.addChild(option)
        
        affichageTexte(bouton: Name, text: "Solar", fontS: 200, xW: 0.5, yH: 0.8)
        affichageTexte(bouton: Name1, text: "Shoot", fontS: 200, xW: 0.5, yH: 0.7)
        affichageTexte(bouton: Bouton1, text: "son", fontS: 100, xW: 0.5, yH: 0.5)
        Bouton1.name = "bouton1"
        affichageTexte(bouton: Bouton2, text: "musique", fontS: 100, xW: 0.5, yH: 0.4)
        Bouton2.name = "bouton2"
        affichageTexte(bouton: Bouton3, text: "retour", fontS: 100, xW: 0.5, yH: 0.3)
        Bouton3.name = "bouton3"
        
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
            
            if (nodeTapped.name  == "bouton2"){
                if(musique.getMusiqueActivee()){
                    musique.stopMusique()
                    musiqueActivee = false
                }
                else{
                    musique.playMusique()
                    musiqueActivee = true
                    
                }
                print(musiqueActivee)
                
            }
            
            if (nodeTapped.name  == "bouton3"){
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
}
