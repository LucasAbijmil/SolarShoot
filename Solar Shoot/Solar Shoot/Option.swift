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
    let soundOnLabel = SKSpriteNode(imageNamed:"SoundOn")
    let soundOffLabel = SKSpriteNode(imageNamed:"SoundOff")
    let Name = SKLabelNode(fontNamed :"Starjedi")
    let Name1 = SKLabelNode(fontNamed :"Starjedi")
    let Bouton2 = SKLabelNode(fontNamed :"Starjedi")
    let Bouton3 = SKLabelNode(fontNamed :"Starjedi")
    //let musique = Music(musiqueActivee: musiqueActivee )
    
    //constructeur
    override init (size: CGSize) {
        super.init(size: size)
        
        //Permet d'avoir la musique sans appuyer sur le bouton musique si à la base la musique était déjà activée
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueOptionCredits")
        }
        
        //affichage du fond d'écran
        option.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        option.zPosition = 0
        self.addChild(option)
        
        //affichage de l'icone son activé
        soundOnLabel.setScale(0.2)
        soundOnLabel.position = CGPoint(x: self.size.width/2.3 , y: self.size.height/2)
        soundOnLabel.zPosition = 100
        soundOnLabel.name="boutonOn"
        self.addChild(soundOnLabel)
        
        //affichage de l'icone son désactivé
        soundOffLabel.setScale(0.15)
        soundOffLabel.position = CGPoint(x: self.size.width/1.7 , y: self.size.height/2)
        soundOffLabel.zPosition = 100
        soundOffLabel.name="boutonOff"
        self.addChild(soundOffLabel)

        
        affichageTexte(bouton: Name, text: "Solar", fontS: 200, xW: 0.5, yH: 0.8)
        affichageTexte(bouton: Name1, text: "Shoot", fontS: 200, xW: 0.5, yH: 0.7)
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
            
            //si on clique sur l'icone  du son off , il se désactivra
            if (nodeTapped.name  == "boutonOff"){
                if(sons.getSonsActivee() == true){
                    sonsActivee = false
                    sons.setSonsActivee(valeur: false)
                }
            }
            
            //si on clique sur l'icone du son on , il s'activra
            if (nodeTapped.name  == "boutonOn"){
                if(sons.getSonsActivee() == false){
                sonsActivee = true
                sons.setSonsActivee(valeur: true)
                }
            }
            
            //si on clique sur la musique , elle se s'activra ou se désactivra
            if (nodeTapped.name  == "bouton2"){
                if(musique.getMusiqueActivee()){
                    musique.stopMusique(NameMusique: "MusiqueOptionCredits")
                    musiqueActivee = false
                }
                else{
                    musique.playMusique(NameMusique: "MusiqueOptionCredits")
                    musiqueActivee = true
                }
            }
            
    
            //si on clique sur le bouton menu (bouton3) la scène du menu apparait
            if (nodeTapped.name  == "bouton3"){
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
}
