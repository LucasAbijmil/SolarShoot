//
//  EndScene.swift
//  Solar Shoot
//
//  Created by Projet-L2R1 on 07/03/2019.
//  Copyright © 2019 Projet-L2R1. All rights reserved.
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
    let highScoreLabel = SKLabelNode(fontNamed :"Starjedi")
    let Bouton = SKLabelNode(fontNamed :"Starjedi")
    let Bouton1 = SKLabelNode(fontNamed :"Starjedi")
    
    
    
    //constructeur
    override init (size: CGSize) {
        super.init(size: size)
        
        //variables qui permettent d'avoir un meilleur score différent par niveau grace au UserDefaults qui permet d'initialiser par défaut la valeur du meilleur score à 0
        var highScoreNumber1 = defaults.integer(forKey: "highScoreSaved1")
        var highScoreNumber2 = defaults.integer(forKey: "highScoreSaved2")
        var highScoreNumber3 = defaults.integer(forKey: "highScoreSaved3")
        var highScoreNumber4 = defaults.integer(forKey: "highScoreSaved4")
        var highScoreNumber5 = defaults.integer(forKey: "highScoreSaved5")
        var highScoreNumber6 = defaults.integer(forKey: "highScoreSaved6")
        var highScoreNumber7 = defaults.integer(forKey: "highScoreSaved7")
        var highScoreNumber8 = defaults.integer(forKey: "highScoreSaved8")
        
        
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
        
        affichageTexte(bouton: Bouton, text: "Rejouer", fontS: 100, xW: 0.5, yH: 0.4)
        Bouton.name = "bouton"
        
        affichageTexte(bouton: Bouton1, text: "Menu", fontS: 100, xW: 0.5, yH: 0.3)
        Bouton1.name = "bouton1"
        
        // permet d'établir le meilleur score pour chaque niveau
        switch lvlSelected {
        case 1 :
            if(gameScore > highScoreNumber1) {
                highScoreNumber1 = gameScore
                defaults.set(highScoreNumber1, forKey:"highScoreSaved1")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber1)
            
            break
        case 2 :
            if(gameScore > highScoreNumber2) {
                highScoreNumber2 = gameScore
                defaults.set(highScoreNumber2, forKey:"highScoreSaved2")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber2)
            break
        case 3 :
            if(gameScore > highScoreNumber3) {
                highScoreNumber3 = gameScore
                defaults.set(highScoreNumber3, forKey:"highScoreSaved3")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber3)
            break
        case 4 :
            if(gameScore > highScoreNumber4) {
                highScoreNumber4 = gameScore
                defaults.set(highScoreNumber4, forKey:"highScoreSaved4")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber4)
            break
        case 5 :
            if(gameScore > highScoreNumber5) {
                highScoreNumber5 = gameScore
                defaults.set(highScoreNumber5, forKey:"highScoreSaved5")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber5)
            break
        case 6 :
            if(gameScore > highScoreNumber6) {
                highScoreNumber6 = gameScore
                defaults.set(highScoreNumber6, forKey:"highScoreSaved6")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber6)
            break
        case 7 :
            if(gameScore > highScoreNumber7) {
                highScoreNumber7 = gameScore
                defaults.set(highScoreNumber7, forKey:"highScoreSaved7")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber7)
            break
        case 8 :
            if(gameScore > highScoreNumber8) {
                highScoreNumber8 = gameScore
                defaults.set(highScoreNumber8, forKey:"highScoreSaved8")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber8)
            break
        default :
            if(gameScore > highScoreNumber1) {
                highScoreNumber1 = gameScore
                defaults.set(highScoreNumber1, forKey:"highScoreSaved1")
            }
            AffichageMeilleursScoreNiveau(highScoreNumber: highScoreNumber1)
            break
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //fonction qui permet d'afficher le meilleur score pour chaque niveau
    func AffichageMeilleursScoreNiveau(highScoreNumber: Int){
        let highScoreString = highScoreNumber.formattedWithSeparatorGameOverScene
        affichageTexte(bouton: highScoreLabel, text: "Meilleur score : \(highScoreString)", fontS: 60, xW: 0.5, yH: 0.5)
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
