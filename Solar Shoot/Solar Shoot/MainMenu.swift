//
//  MainMenu.swift
//  shooter
//
//  Created by Projet L2R1 on 03/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//
import Foundation
import SpriteKit

class MainmenuSolar:SKScene{
    
    //attributs déclaration des variables
    private let menu = SKSpriteNode(imageNamed: "Menu")
    private let Name = SKLabelNode(fontNamed :"Starjedi")
    private let Name1 = SKLabelNode(fontNamed :"Starjedi")
    private let Bouton1 = SKLabelNode(fontNamed :"Starjedi")
    private let Bouton2 = SKLabelNode(fontNamed :"Starjedi")
    private let Bouton3 = SKLabelNode(fontNamed :"Starjedi")
    
    override init (size: CGSize) {
        super.init(size: size)
        
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueMenu")
        }
        else {
            musique.stopMusique(NameMusique: "MusiqueMenu")
        }
        
        //affichage du fond d'écran
        menu.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        menu.zPosition = 0
        self.addChild(menu)
        
        //affichage du texte Solar
        affichageTexte(bouton: Name, text: "Solar", fontS: 200, xW: 0.5, yH: 0.8)
        
        //affichage du texte Shoot
        affichageTexte(bouton: Name1, text: "Shoot", fontS: 200, xW: 0.5, yH: 0.7)
        
        //Declacartion et ajout du bouton jouer
        affichageTexte(bouton: Bouton1, text: "Jouer", fontS: 100, xW: 0.5, yH: 0.5)
        Bouton1.name = "bouton1"
        
        //Declacartion et ajout du bouton option
        affichageTexte(bouton: Bouton2, text: "options", fontS: 100, xW: 0.5, yH: 0.4)
        Bouton2.name = "bouton2"
        
        //Declacartion et ajout du bouton crédit
        affichageTexte(bouton: Bouton3, text: "Crédits", fontS: 100, xW: 0.5, yH: 0.3)
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
            
            if (nodeTapped.name  == "bouton1"){
                transition(newScene: Carte(size: self.size))
            }
            
            //si on tape sur sur Option (bouton2) une autre scene apparait
            if (nodeTapped.name  == "bouton2"){
                transition(newScene: Option(size: self.size))
            }
            
            //si on tape sur sur Credits (bouton3) une autre scene apparait
            if (nodeTapped.name  == "bouton3"){
                transition(newScene: Credits(size: self.size))
            }
            
        }
    }
    
    
}
