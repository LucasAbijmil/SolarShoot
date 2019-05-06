//
//  WinScene.swift
//  shooter
//
//  Created by Mehir bitan on 08/04/2019.
//  Copyright © 2019 Dovratt bitan. All rights reserved.
//
import Foundation
import SpriteKit

extension Formatter {
    static let WithSeparatorWinScene: NumberFormatter = {
        let spaceScore = NumberFormatter()
        spaceScore.groupingSeparator = " "
        spaceScore.numberStyle = .decimal
        return spaceScore
    } ()
}
extension BinaryInteger {
    var formattedWithSeparatorWinScene: String {
        return Formatter.WithSeparatorGameOverScene.string(for: self) ?? ""
    }
}

class WinScene : SKScene {
    
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
        
        //affichage du font d'écran
        endScene.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        endScene.zPosition = 0
        self.addChild(endScene)
        
        affichageTexte(bouton: Name, text: "Niveau Réussi", fontS: 100, xW: 0.5, yH: 0.8)
        
        affichageTexte(bouton: scoreLabel, text: "Score : \(gameScoreString)", fontS: 100, xW: 0.5, yH: 0.6)
        
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        if(gameScore > highScoreNumber) {
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey:"highScoreSaved")
        }
        let hightScoreString = highScoreNumber.formattedWithSeparatorGameOverScene
        affichageTexte(bouton: hightScoreLabel, text: "Meilleur score : \(hightScoreString)", fontS: 60, xW: 0.5, yH: 0.5)
        
        affichageTexte(bouton: Bouton, text: "Carte", fontS: 100, xW: 0.5, yH: 0.4)
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
                
                switch lvlNumber {
                    
                case 1 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                case 2 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                case 3 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                case 4 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                case 5 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                case 6 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                case 7 :
                    
                    if lvlSelected == lvlNumber { lvlNumber += 1}
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                default :
                    
                    transition(newScene: Carte(size: self.size))
                    
                    break
                    
                }
                
            }
            
            if (nodeTapped.name  == "bouton1"){
                transition(newScene: MainmenuSolar(size: self.size))
            }
        }
    }
}
