
////
//  Carte.swift
//  Solar Shoot V1
//
//  Created by wered achouche on 11/03/2019.


import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics
import UIKit

var lvlSelected : Int = 0

class Carte:SKScene{
    
    //attributs
    let mercury = SKSpriteNode(imageNamed: "Mercure")
    let venus = SKSpriteNode(imageNamed: "Venus")
    let hearth = SKSpriteNode(imageNamed: "Terre")
    let mars = SKSpriteNode(imageNamed: "Mars")
    let jupiter = SKSpriteNode(imageNamed: "Jupiter")
    let saturn = SKSpriteNode(imageNamed: "Saturne")
    let uranus = SKSpriteNode(imageNamed: "Uranus")
    let neptune = SKSpriteNode(imageNamed: "Neptune")
    let Carte = SKSpriteNode(imageNamed: "Carte")
    
    //constructeur
    override init(size: CGSize){
        super.init(size: size)
        
        //affichage du fond d'écran
        Carte.size = self.size
        Carte.position = CGPoint(x: self.size.width/2, y:self.size.height/2)
        Carte.zPosition = -1
        self.addChild(Carte)
        
        //affichages des traits transparents
        let yourline = SKShapeNode()
        let  pathToDraw = CGMutablePath()
        
        pathToDraw.move(to: CGPoint(x: self.size.width * 0.7 , y: self.size.height/6.30))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.35, y: self.size.height/5.0),control: CGPoint(x:size.width*0.4, y:size.height/10.5))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.6, y: self.size.height/2.80),control: CGPoint(x:size.width*0.4, y:size.height/2.5))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*0.4, y: self.size.height/2.0),control: CGPoint(x:size.width*0.5, y:size.height/2.5))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*(2/3), y: self.size.height/1.80),control: CGPoint(x:size.width*0.4, y:size.height/(10/6.5)))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*(2/3), y: self.size.height/1.40),control: CGPoint(x:size.width*0.75, y:size.height/(10/6.5)))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*(1/2), y: self.size.height/1.22), control: CGPoint(x:size.width*0.75, y:size.height/(10/8)))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width * 0.3 , y: self.size.height/(10/9)),control: CGPoint(x:size.width*0.4, y:size.height/(10/9.9)))
        yourline.path = pathToDraw
        yourline.glowWidth = 5
        yourline.alpha = 0.3
        yourline.strokeColor = SKColor.white
        yourline.lineWidth = 7
        addChild(yourline)
        
        //affichage et position des planètes
        AjoutPlanete(planete: mercury, scale: 0.45, Xpos: 0.7, Ypos: 6.30, name: "lvl1")
        
        AjoutPlanete(planete: venus, scale: 0.35, Xpos: 0.35, Ypos: 5.0, name: "lvl2")
        
        AjoutPlanete(planete: hearth, scale: 0.35, Xpos: 0.6, Ypos: 2.80, name: "lvl3")
        
        AjoutPlanete(planete: mars, scale: 0.35, Xpos: 0.4, Ypos: 2.0, name: "lvl4")
        
        AjoutPlanete(planete: jupiter, scale: 0.35, Xpos: (2/3), Ypos: 1.80, name: "lvl5")
        
        AjoutPlanete(planete: saturn, scale: 0.45, Xpos: (2/3), Ypos: 1.40, name: "lvl6")
        
        AjoutPlanete(planete: uranus, scale: 0.35, Xpos: (1/2), Ypos: 1.22, name: "lvl7")
        
        AjoutPlanete(planete: neptune, scale: 0.45, Xpos: 0.3, Ypos: (10/9), name: "lvl8")
        
        
        
        //affichages des traits blancs en fonction des niveaux
        if (lvlNumber >= 2 && lvlNumber != 8){
            modifierLine(xP: 0.7, yP: 6.3, xP1: 0.35, yP1: 5.0, xC: 0.4, yC: 10.5 )
        }
        if (lvlNumber >= 3 && lvlNumber != 8){
            modifierLine(xP:0.35, yP: 5.0, xP1: 0.6, yP1: 2.80, xC: 0.4, yC: 2.5)
        }
        if (lvlNumber >= 4 && lvlNumber != 8){
            modifierLine(xP: 0.6, yP: 2.80, xP1: 0.4, yP1: 2.0, xC: 0.5, yC: 2.5)
        }
        if (lvlNumber >= 5 && lvlNumber != 8){
            modifierLine(xP: 0.4, yP: 2.0, xP1: (2/3), yP1: 1.80, xC: 0.4, yC: (10/6.5))
        }
        if (lvlNumber >= 6 && lvlNumber != 8){
            modifierLine(xP: (2/3), yP: 1.80, xP1:( 2/3), yP1: 1.40, xC: 0.75, yC: (10/6.5) )
        }
        if (lvlNumber >= 7 && lvlNumber != 8) {
            modifierLine(xP: (2/3), yP: 1.40, xP1: (1/2), yP1: 1.22, xC: 0.75, yC: (10/8))
        }
        if (lvlNumber >= 8 ){
            modifierLine(xP: 0.7, yP: 6.3, xP1: 0.35, yP1: 5.0, xC: 0.4, yC: 10.5 )
            modifierLine(xP:0.35, yP: 5.0, xP1: 0.6, yP1: 2.80, xC: 0.4, yC: 2.5)
            modifierLine(xP: 0.6, yP: 2.80, xP1: 0.4, yP1: 2.0, xC: 0.5, yC: 2.5)
            modifierLine(xP: 0.4, yP: 2.0, xP1: (2/3), yP1: 1.80, xC: 0.4, yC: (10/6.5))
            modifierLine(xP: (2/3), yP: 1.80, xP1:( 2/3), yP1: 1.40, xC: 0.75, yC: (10/6.5))
            modifierLine(xP: (2/3), yP: 1.40, xP1: (1/2), yP1: 1.22, xC: 0.75, yC: (10/8))
            modifierLine(xP: (1/2), yP: 1.22, xP1: 0.3, yP1: 10/9, xC: 0.4, yC: (10/9.9))
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //méthodes
    func bouton ( lvlSelec : Int){
        
        lvlSelected = lvlSelec
        let scene = GameScene(size: self.size)
        scene.scaleMode = self.scaleMode
        let Transition = SKTransition.reveal(with: .down, duration: 1.5)
        self.view!.presentScene(scene, transition:Transition)
        
    }
    func AjoutPlanete (planete :SKSpriteNode, scale : CGFloat, Xpos : CGFloat,Ypos:CGFloat, name: String){
        planete.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        planete.setScale(scale)
        planete.position = CGPoint(x: self.size.width*Xpos , y: self.size.height/Ypos)
        planete.zPosition = 2
        planete.name = name
        self.addChild(planete)
    }
    
    func modifierLine(xP : CGFloat, yP : CGFloat, xP1 : CGFloat, yP1 :CGFloat, xC : CGFloat, yC : CGFloat ){
        let yourline = SKShapeNode()
        let  pathToDraw = CGMutablePath()
        pathToDraw.move(to: CGPoint(x: self.size.width * xP , y: self.size.height/yP))
        pathToDraw.addQuadCurve(to: CGPoint(x: self.size.width*xP1, y: self.size.height/yP1),control: CGPoint(x:size.width*xC, y:size.height/yC))
        yourline.path = pathToDraw
        yourline.glowWidth = 8
        yourline.alpha = 0.9
        yourline.strokeColor = SKColor.white
        yourline.lineWidth = 10
        addChild(yourline)
    }
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        
        
        for touch: AnyObject in touches{
            
            
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            //Permission d'accès à la planète en fonction du niveau actuel
            if (lvlNumber  == 1) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
            }
                
            else if (lvlNumber <= 2) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
            }
                
            else if (lvlNumber <= 3) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
                else if (nodeTapped.name == "lvl3"){
                    bouton(lvlSelec: 3)
                }
            }
            else if (lvlNumber <= 4) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
                else if (nodeTapped.name == "lvl3"){
                    bouton(lvlSelec: 3)
                }
                else if (nodeTapped.name == "lvl4"){
                    bouton(lvlSelec: 4)
                }
            }
            else if (lvlNumber <= 5) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
                else if (nodeTapped.name == "lvl3"){
                    bouton(lvlSelec: 3)
                }
                else if (nodeTapped.name == "lvl4"){
                    bouton(lvlSelec: 4)
                }
                else if (nodeTapped.name == "lvl5"){
                    bouton(lvlSelec: 5)
                }
            }
            else if (lvlNumber <= 6) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
                else if (nodeTapped.name == "lvl3"){
                    bouton(lvlSelec: 3)
                }
                else if (nodeTapped.name == "lvl4"){
                    bouton(lvlSelec: 4)
                }
                else if (nodeTapped.name == "lvl5"){
                    bouton(lvlSelec: 5)
                }
                else if (nodeTapped.name == "lvl6"){
                    bouton(lvlSelec: 6)
                }
            }
            else if (lvlNumber <= 7) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
                else if (nodeTapped.name == "lvl3"){
                    bouton(lvlSelec: 3)
                }
                else if (nodeTapped.name == "lvl4"){
                    bouton(lvlSelec: 4)
                }
                else if (nodeTapped.name == "lvl5"){
                    bouton(lvlSelec: 5)
                }
                else if (nodeTapped.name == "lvl6"){
                    bouton(lvlSelec: 6)
                }
                else if (nodeTapped.name == "lvl7"){
                    bouton(lvlSelec: 7)
                }
            }
                
            else if (lvlNumber <= 8) {
                if (nodeTapped.name == "lvl1"){
                    bouton(lvlSelec: 1)
                }
                else if (nodeTapped.name == "lvl2"){
                    bouton(lvlSelec: 2)
                }
                else if (nodeTapped.name == "lvl3"){
                    bouton(lvlSelec: 3)
                }
                else if (nodeTapped.name == "lvl4"){
                    bouton(lvlSelec: 4)
                }
                else if (nodeTapped.name == "lvl5"){
                    bouton(lvlSelec: 5)
                }
                else if (nodeTapped.name == "lvl6"){
                    bouton(lvlSelec: 6)
                }
                else if (nodeTapped.name == "lvl7"){
                    bouton(lvlSelec: 7)
                }
                else if (nodeTapped.name == "lvl8"){
                    bouton(lvlSelec: 8)
                }
                
            }
        }
    }
}


