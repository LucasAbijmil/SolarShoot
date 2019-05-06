//
//  EndScene.swift
//  Solar Shoot
//
//  Created by Lucas Abijmil on 07/03/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import Foundation
import SpriteKit

extension Formatter {
    static let WithSeparatorGameOverScene: NumberFormatter = {
        let spaceScore = NumberFormatter()
        spaceScore.groupingSeparator = " "
        spaceScore.numberStyle = .decimal
        return spaceScore
    } ()
}
extension BinaryInteger {
    var formattedWithSeparatorGameOverScene: String {
        return Formatter.WithSeparatorGameOverScene.string(for: self) ?? ""
    }
}
class GameOverScene : SKScene {
    
    //attributs déclaration des variables
    let endScene = SKSpriteNode(imageNamed: "Menu")
    let Name = SKLabelNode(fontNamed :"Starjedi")
    let scoreLabel = SKLabelNode(fontNamed: "Starjedi")
    let defaults = UserDefaults()
    let hightScoreLabel = SKLabelNode(fontNamed :"Starjedi")
    let Bouton = SKLabelNode(fontNamed :"Starjedi")
    let Bouton1 = SKLabelNode(fontNamed :"Starjedi")
    
    
    
    //constructeur
    override init (size: CGSize) {
        super.init(size: size)
        
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueGameScene")
        }
        else {
            musique.stopMusique(NameMusique: "MusiqueGameScene")
        }
        
        //affichage du font d'écran
        endScene.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        endScene.zPosition = 0
        self.addChild(endScene)
        
        affichageTexte(bouton: Name, text: "game over", fontS: 140, xW: 0.5, yH: 0.8)
        
        affichageTexte(bouton: scoreLabel, text: "Score : \(gameScore)", fontS: 100, xW: 0.5, yH: 0.6)
        
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        if(gameScore > highScoreNumber) {
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey:"highScoreSaved")
        }
        let hightScoreString = highScoreNumber.formattedWithSeparatorGameOverScene
        affichageTexte(bouton: hightScoreLabel, text: "Meilleur score : \(hightScoreString)", fontS: 60, xW: 0.5, yH: 0.5)
        
        affichageTexte(bouton: Bouton, text: "Rejouer", fontS: 100, xW: 0.5, yH: 0.4)
        Bouton.name = "bouton"
        
        affichageTexte(bouton: Bouton1, text: "Menu", fontS: 100, xW: 0.5, yH: 0.3)
        Bouton1.name = "bouton1"
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
            
            if (nodeTapped.name  == "bouton"){
                transition(newScene: GameScene(size: self.size))
            }
            
            if (nodeTapped.name  == "bouton1"){
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
}

