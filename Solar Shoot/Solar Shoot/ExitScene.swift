//
//  StopScene.swift
//  shooter
//
//  Created by Projet L2R1 on 03/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//
import Foundation
import SpriteKit

class ExitScene: SKScene{
    //attributs déclaration des variables
    private let menuf = SKSpriteNode(imageNamed: "Menu")
    private let repprendre = SKLabelNode(fontNamed :"Starjedi")
    private let restart = SKLabelNode(fontNamed :"Starjedi")
    private let menu = SKLabelNode(fontNamed :"Starjedi")
    //let musique = Music(musiqueActivee: musiqueActivee)
    
    
    //constructeur
    override init (size: CGSize) {
        super.init(size: size)
        
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueOptionCredits")
        }
        else {
            musique.stopMusique(NameMusique: "MusiqueOptionCredits")
        }
        
        //affichage du fond d'écran
        menuf.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        menuf.zPosition = 0
        self.addChild(menuf)
        
        //affichage des boutons
        affichageTexte(bouton: restart, text: "Restart", fontS: 100, xW: 0.5, yH: 0.5)
        restart.name = "Restart"
        
        //affichage du texte
        affichageTexte(bouton: menu, text: "Menu", fontS: 100, xW: 0.5, yH: 0.35)
        menu.name = "Menu"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //fonction qui permet d'afficher le texte
    func affichageTexte(bouton: SKLabelNode, text: String, fontS: Int, xW: CGFloat, yH: CGFloat){
        bouton.text = text
        bouton.fontSize = CGFloat(fontS)
        bouton.fontColor = SKColor.white
        bouton.position = CGPoint(x:self.size.width*xW,y:self.size.height*yH)
        bouton.zPosition = 1
        self.addChild(bouton)
    }
    
    //fonction qui permet de faire les transitions entre les scènes
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
            
            //si on tape sur sur Restart une autre scene apparait
            if (nodeTapped.name  == "Restart"){
                transition(newScene: GameScene(size: self.size))
            }
            
            //si on tape sur sur Credits (bouton3) une autre scene apparait
            if (nodeTapped.name  == "Menu"){
                transition(newScene: MainmenuSolar(size: self.size))
            }
            
        }
    }
    
}
