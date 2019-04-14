//
//  GameScene.swift
//  Solar Shoot V1
//
//  Created by L2R1 on 19/02/2019.
//  Copyright © 2019 Lucas Abijmil. All rights reserved.
//

import SpriteKit
import GameplayKit
extension Formatter {
    static let WithSeparatorGameScene: NumberFormatter = {
        let spaceScore = NumberFormatter()
        spaceScore.groupingSeparator = " "
        spaceScore.numberStyle = .decimal
        return spaceScore
    } ()
}
extension BinaryInteger {
    var formattedWithSeparatorGameScene: String {
        return Formatter.WithSeparatorGameScene.string(for: self) ?? ""
    }
}

var gameScore = 0 //Cette variable est publique à toutes les scenes
var lvlNumber : Int = 5
var lvlRequired : Int = 1
let gameScoreString = gameScore.formattedWithSeparatorGameScene
let musique = Music(musiqueActivee: musiqueActivee)
var stopLabel = SKSpriteNode(imageNamed:"play")
let exitLabel = SKSpriteNode(imageNamed:"exit")
class GameScene: SKScene, SKPhysicsContactDelegate {
    private var play : Bool
    
    
 /**********************************************************************************************************************************************************************************\
                                                        Declaration of general var
\***********************************************************************************************************************************************************************************/
    
    //On déclare toutes les planètes en fonctions des niveaux
    public var planet = Planet(imageName: "Planet")
    public var planetIcon = PlanetLife(image: "Planet")
    
    private var planetLvlI = PlanetLife(image: "Mercure")
    private var planetLvl1 = Planet(imageName: "Mercure")
    
    private var planetLvlII = PlanetLife(image: "Venus")
    private var planetLvl2 = Planet(imageName: "Venus")
    
    private var planetLvlIII = PlanetLife(image: "Terre")
    private var planetLvl3 = Planet(imageName: "Terre")
    
    private var planetLvlIV = PlanetLife(image: "Mars")
    private var planetLvl4 = Planet(imageName: "Mars")
    
    private var planetLvlV = PlanetLife(image: "Jupiter")
    private var planetLvl5 = Planet(imageName: "Jupiter")
    
    private var planetLvlVI = PlanetLife(image: "Saturne")
    private var planetLvl6 = Planet(imageName: "Saturne")
    
    private var planetLvlVII = PlanetLife(image: "Uranus")
    private var planetLvl7 = Planet(imageName: "Uranus")
    
    private var planetLvlVIII = PlanetLife(image: "Neptune")
    private var planetLvl8 = Planet(imageName: "Neptune")
    

    private var bullet = Bullet(imageName: "Bullet")
    
 //   private var background = Background(imageName: "BackgroundTest")
    private var asteroide = Asteroides(img: "Asteroid")
    
    
    private var label = Label()
   
    
    
    // let back = SKSpriteNode(imageNamed: "Background")
   
    
    
    let bulletSound = SKAction.playSoundFileNamed("Bulletsong.mp3", waitForCompletion: false)
    let explosionSound = SKAction.playSoundFileNamed("Explosionsong.mp3", waitForCompletion: false)
    enum gameState { // Pe rmet de dire dans quel état est le jeu
        case preGame // avant le début du niveau
        case inGame // pendant le niveau
        case StopedGame // si le joueur fait pause
        case afterGame // après le niveau ––> gagné ou perdu
    }
    var currentGameState = gameState.preGame //Ici on indique on fixe la valeur à inGame ; int = confusion
    struct physicsCategories {
        static let none : UInt32 = 0
        static let planet : UInt32 = 0b1 // 1 en binaire
        static let bullet : UInt32 = 0b10 // 2 en binaire
        static let asteroid: UInt32 = 0b100 // 4 en binaire
    }
    
    
    //var gameScore = 0 ––> Placé en public afin que les menus GameOver / Win puissent y accéder
    /*var gameScoreLabel = SKLabelNode(fontNamed: "Starjedi")*/
    var pointLife = 3
   /* let planetLife = SKSpriteNode(imageNamed: "Planet")
    var pointLifeLabel = SKLabelNode(fontNamed: "Starjedi")
    var xPointLifeLabel = SKLabelNode(fontNamed: "Starjedi")
    let tapToBeginLabel = SKLabelNode(fontNamed: "Starjedi")*/
    private var updateTime: Double = 0
    var lastUpdateTime : TimeInterval = 0
    var deltaFrameTime : TimeInterval = 0
    var amountToMovePerSecond : CGFloat = 800.0
    
/**********************************************************************************************************************************************************************************\
                                                            Declaration Game Area, Background, Planet
\***********************************************************************************************************************************************************************************/
    
    let gameArea : CGRect
    override init (size : CGSize) {
        let maxRatioAspect: CGFloat =  16.0 / 9.0
        let widthPlayable = size.height / maxRatioAspect
        let widthMargin =  (size.width - widthPlayable) / 2
        let heightPlayable = size.width / maxRatioAspect
        let heightMargin = (size.height - heightPlayable) / 1000
        gameArea = CGRect(x: widthMargin, y: heightMargin, width: widthPlayable, height: heightPlayable)
        play.self = true
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    override func didMove(to view: SKView) {
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique()
        }
        else {
            musique.stopMusique()
        }
        gameScore = 0 //On réinitialise le gameScore à 0, sinon "garderait" le score d'avant
        self.physicsWorld.contactDelegate = self
        /*func afficher(planet:Planet,planetIcon:PlanetLife){
            self.planet = planet
            planet.addPlanet(parent: self)
            planet.phys()
            self.planetIcon = planetIcon
            planetIcon.addPlanet(parent: self)
        }*/
        for i in 0...1 {
            func AffichageBack(background:SKSpriteNode){
                background.size = self.size
                background.anchorPoint = CGPoint(x: 0.5, y: 0)
                background.position = CGPoint(x: self.size.width / 2,
                                              y: self.size.height * CGFloat(i))
                background.zPosition = 0
                background.name = "Background"
                self.addChild(background)
            }
            switch lvlSelected {
            case 1 :
                let background = SKSpriteNode(imageNamed: "Fond_Mercure")
                AffichageBack(background: background)
                break
            case 2 :
                let background = SKSpriteNode(imageNamed: "Fond_Venus")
                AffichageBack(background: background)
                break
            case 3 :
                let background = SKSpriteNode(imageNamed: "Fond_Terre")
                AffichageBack(background: background)
                break
            case 4 :
                let background = SKSpriteNode(imageNamed: "Fond_Mars")
                AffichageBack(background: background)
                break
            case 5 :
                let background = SKSpriteNode(imageNamed: "Fond_Jupiter")
                AffichageBack(background: background)
                break
            case 6 :
                let background = SKSpriteNode(imageNamed: "Fond_Saturne")
                AffichageBack(background: background)
                break
            case 7 :
                let background = SKSpriteNode(imageNamed: "Fond_Uranus")
                AffichageBack(background: background)
                break
            case 8 :
                let background = SKSpriteNode(imageNamed: "Fond_Neptune")
                AffichageBack(background: background)
                break
            default:
                let background = SKSpriteNode(imageNamed: "Carte")
                AffichageBack(background: background)
                break
    
            }
        }
            //Utilisation classe background
            //background.jeuBackground(parent: self) //ne sert a rien, ya tt juste au-dessus
            //background.scrolling(image: back, parent: self)//thread
       
           switch lvlSelected {
            case 1 :
                label.afficherPlanet(parent:self,planet:planetLvl1,planetIcon:planetLvlI)
                break
            case 2 :
                label.afficherPlanet(parent:self,planet:planetLvl2,planetIcon:planetLvlII)
                break
            case 3 :
                label.afficherPlanet(parent:self,planet:planetLvl3,planetIcon:planetLvlIII)
                break
            case 4 :
                label.afficherPlanet(parent:self,planet:planetLvl4,planetIcon:planetLvlIV)
                break
            case 5 :
                label.afficherPlanet(parent:self,planet:planetLvl5,planetIcon:planetLvlV)
                break
            case 6 :
                label.afficherPlanet(parent:self,planet:planetLvl6,planetIcon:planetLvlVI)
                break
            case 7 :
                label.afficherPlanet(parent:self,planet:planetLvl7,planetIcon:planetLvlVII)
                break
            case 8 :
                label.afficherPlanet(parent:self,planet:planetLvl8,planetIcon:planetLvlVIII)
                break
            default :
                planet.addPlanet(parent: self)
                planet.phys()
                planetIcon.addPlanet(parent: self)
                break
            }
        
        label.AffichageLabel(label: label.gameScoreLabel, text: "0", fontS: 50, horAlign: SKLabelHorizontalAlignmentMode.left, xW: 0.20,parent: self)
        label.AffichageLabel(label: label.xPointLifeLabel, text: "x", fontS: 30, horAlign: SKLabelHorizontalAlignmentMode.right, xW: 0.73,parent: self)
        label.AffichageLabel(label: label.pointLifeLabel, text: "3", fontS: 50, horAlign: SKLabelHorizontalAlignmentMode.right, xW: 0.75,parent: self)
        
       
        let moveToScreen = SKAction.moveTo(y: self.size.height*0.9, duration: 1.5)
        label.gameScoreLabel.run(moveToScreen)
        label.xPointLifeLabel.run(moveToScreen)
        label.pointLifeLabel.run(moveToScreen)
        planetIcon.run(moveToScreen)
        
        label.phrasePreGame(parent:self,label : label.tapToBeginLabel)
        
        //fonctionne pas parfaitement
        let scrollRightToLeft = SKAction.moveTo(x: -self.size.width*0.5, duration: 8)
        let resetScroll = SKAction.moveTo(x: label.tapToBeginLabel.position.x, duration: 0)
        let scrollSequence = SKAction.sequence([scrollRightToLeft, resetScroll])
        let scrollSequenceRepeat = SKAction.repeatForever(scrollSequence)
        label.tapToBeginLabel.run(scrollSequenceRepeat)
        
        stopLabel.setScale(0.4)
        //stopLabel.position = CGPoint(x: self.size.width*0.2 , y: self.size.height*1.25)
        stopLabel.position = CGPoint(x: self.size.width/2 , y: self.size.height/18)
        stopLabel.zPosition = 100
        stopLabel.name="boutonPause"
        self.addChild(stopLabel)
        
        exitLabel.setScale(0.1)
        exitLabel.position = CGPoint(x: self.size.width/4 , y: self.size.height/18)
        exitLabel.zPosition = 100
        exitLabel.name="boutonExit"
        self.addChild(exitLabel)
        
        
    }
    
/***********************************************************************************************************************************************************************************\
                                                                    Declaration Bullet, func FireBullet
\***********************************************************************************************************************************************************************************/
    
    
    func fireBullet () {
        let bullet = SKSpriteNode(imageNamed: "Bullet")
        bullet.name = "Bullet" //afin de permettre l'arrêt des missiles en cas de gameOver
        bullet.setScale(0.5)
        bullet.position = CGPoint(x: planet.position.x, y: planet.position.y)
        bullet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bullet.zPosition = 1
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size) // changer le rectangle en forme circulaire
        bullet.physicsBody!.affectedByGravity = false
        bullet.physicsBody!.categoryBitMask = physicsCategories.bullet
        bullet.physicsBody!.collisionBitMask = physicsCategories.none
        bullet.physicsBody!.contactTestBitMask = physicsCategories.asteroid
        self.addChild(bullet)
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1.0)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound, moveBullet, deleteBullet])
        bullet.run(bulletSequence)
    }
    
    
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentGameState == gameState.preGame {
            gameStart()
        }
       else if currentGameState == gameState.inGame {
            fireBullet()
        }
        for touch: AnyObject in touches{
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            if (nodeTapped.name  == "boutonPause"){
                
                if(play){
                    play = false
                    let pauseAction = SKAction.run{
                        self.view?.isPaused = true
                    }
                    self.run(pauseAction)
                    stopLabel = SKSpriteNode(imageNamed:"pause")
                    stopLabel.setScale(0.4)
                    stopLabel.position = CGPoint(x: self.size.width/2 , y: self.size.height/18)
                    stopLabel.zPosition = 100
                    stopLabel.name="boutonPause"
                    self.addChild(stopLabel)
                    
                }
                else{
                    play=true
                    self.view?.isPaused = false
                    stopLabel = SKSpriteNode(imageNamed:"play")
                    stopLabel.setScale(0.4)
                    stopLabel.position = CGPoint(x: self.size.width/2 , y: self.size.height/18)
                    stopLabel.zPosition = 100
                    stopLabel.name="boutonPause"
                    self.addChild(stopLabel)
                    
                }
            }
            if (nodeTapped.name  == "boutonExit"){
                let scene = ExitScene(size: self.size)
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
        }
    }
    
/***********************************************************************************************************************************************************************************\
                                                                        Move Planet
\***********************************************************************************************************************************************************************************/
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            let amountDraggedX = pointOfTouch.x - previousPointOfTouch.x
            let amountDraggedY = pointOfTouch.y - previousPointOfTouch.y
            
            if currentGameState == gameState.inGame {
                planet.position.x += amountDraggedX
                planet.position.y += amountDraggedY
            }
            
            
            if planet.position.x > gameArea.maxX - planet.size.width / 2 {
                planet.position.x = gameArea.maxX - planet.size.width / 2
            }
            if planet.position.x < gameArea.minX + planet.size.width / 2 {
                planet.position.x = gameArea.minX + planet.size.width / 2
            }
            if planet.position.y > gameArea.maxY - planet.size.height / 2  {
                planet.position.y = gameArea.maxY - planet.size.height / 2
            }
            if planet.position.y < gameArea.minY + planet.size.height / 2 {
                planet.position.y = gameArea.minY + planet.size.height / 2
            }
        }
    }
/***********************************************************************************************************************************************************************************\
                                                    Declaration of function random (for asteroids spawn)
\***********************************************************************************************************************************************************************************/
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF) //générer un nombre aléatoire
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
/***********************************************************************************************************************************************************************************\
                                                        Declaration of asteroids and new level
\***********************************************************************************************************************************************************************************/
    
    /*func asteroids (){
        asteroide.addAsteroid(parent: self)
     }*/ //Fonction pour utiliser la classe asteroide : crée un thread
    
    func parametersLevel(){
        let spawn = SKAction.run(asteroids)//Crée une action qui exécute un bloc, ici les asteroides
        let waitSpawn = SKAction.wait(forDuration: 0.8)//Chaque seconde un nouvel asteroides tombe
        let sequence = SKAction.sequence([waitSpawn,spawn])//sequence:asteroides+attendre 0.8 sec
        let spawnForever = SKAction.repeatForever(sequence)//Pour repeter la sequence
        self.run(spawnForever)//executer la sequence
    }
    
    func asteroids () {
        let asteroid = SKSpriteNode(imageNamed: "Asteroid")
        let randomStart = random(min:gameArea.minX, max:gameArea.maxX)
        let randomEnd = random(min:gameArea.minX, max:gameArea.maxX)
        let start = CGPoint(x: randomStart, y: self.size.height * 1.2)
        let end = CGPoint(x: randomEnd, y: -self.size.height * 0.2)
        
        asteroid.name = "Asteroid"
        asteroid.setScale(0.2)
        asteroid.position = start
        asteroid.zPosition = 2
        asteroid.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //asteroid.physicsBody = SKPhysicsBody(rectangleOf: asteroid.size)
        asteroid.physicsBody = SKPhysicsBody(circleOfRadius: asteroid.size.width/3.3, center: asteroid.anchorPoint)
        asteroid.physicsBody!.affectedByGravity = false
        asteroid.physicsBody!.categoryBitMask = physicsCategories.asteroid // Astéroid = 4 en binaire
        asteroid.physicsBody!.collisionBitMask = physicsCategories.none
        asteroid.physicsBody!.contactTestBitMask  = physicsCategories.planet | physicsCategories.bullet
        self.addChild(asteroid)
        
        
        let moveAsteroid = SKAction.move(to: end, duration: 3.5)
        let deleteAsteroid = SKAction.removeFromParent()
        let asteroidSeq = SKAction.sequence([moveAsteroid,deleteAsteroid])
        
     
        
        let oneRevolution = SKAction.rotate(byAngle: CGFloat.pi / 4, duration: 0.1)
        let repeatRevolution = SKAction.repeatForever(oneRevolution)
        
        if currentGameState == gameState.inGame { // pas obligatoire, mais si mauvais timing le jeu freeze
            asteroid.run(asteroidSeq)
            asteroid.run(repeatRevolution)
        }
    }
    
    
/***********************************************************************************************************************************************************************************\
                                                    Declaration of collisions & crash
\***********************************************************************************************************************************************************************************/
    func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            body1 = contact.bodyA
            body2 = contact.bodyB
        }
        else {
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        if body1.categoryBitMask == physicsCategories.planet && body2.categoryBitMask == physicsCategories.asteroid {
            //Si la planète touche un astéroïde
            lifePoint()
            if body1.node != nil && pointLife == 0 { // nil comme NULL ; On créer l'explosion de la planète uniquement si pointLife = 0
                spawnExplosion(spawnPosition: body1.node!.position)
            }
            if body2.node != nil {
                spawnExplosion(spawnPosition : body2.node!.position)
            }
            if pointLife == 0 {
                body1.node?.removeFromParent()
                gameOver() // On appelle la fonction gameOver afin de mettre la gameScene en "pause"
            }
            body2.node?.removeFromParent()
            
        }
        /*  On pourrait faire a fin de mettre le système de point de vie ici
         if body1.categoryBitMask == physicsCategories.planet && body2.categoryBitMask == physicsCategories.asteroid {
         pointLife -= 1
         if pointLife == 0 && body1.node != {
         spawnExplosion(spawnPosition : body1.node!.position)
         body1.node?.removeFromParent()
         }
         */
        
        
        if body1.categoryBitMask == physicsCategories.bullet && body2.categoryBitMask == physicsCategories.asteroid {
            //Si le missile touche un astéroïde
            addScore()
            if body2.node != nil{
                if body2.node!.position.y > self.size.height{
                    return
                }
                else{
                    spawnExplosion(spawnPosition: body2.node!.position)
                }
            }
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
        }
        
        
    }
    
    func spawnExplosion (spawnPosition : CGPoint) {
        let explosion = SKSpriteNode(imageNamed: "Explosion")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0.2)
        self.addChild(explosion)
        let scaleIn = SKAction.scale(to: 0.9, duration: 0.2)
        let fadeOut = SKAction.fadeOut(withDuration: 0.1)
        let deleteExplosion = SKAction.removeFromParent()
        let explosionSequence = SKAction.sequence([explosionSound, scaleIn, fadeOut, deleteExplosion])
        explosion.run(explosionSequence)
        
    }
    
    
/***********************************************************************************************************************************************************************************\
                                                    Functions GameScore, LifePoint, GameStart, GameOver
\***********************************************************************************************************************************************************************************/
    
    func addScore () {
        gameScore += 1000
        label.gameScoreLabel.text = "\(gameScore.formattedWithSeparatorGameScene)"
    }
    
    func lifePoint () {
        pointLife -= 1
        if pointLife <= 1 {
            label.pointLifeLabel.text = "\(pointLife)"
        }
        else if pointLife > 1 {
            label.pointLifeLabel.text = "\(pointLife)"
        }
        label.LifeMultip()
    }
    
    func gameStart () {
        currentGameState = gameState.inGame
        let deleteTapToBeginLabel = SKAction.removeFromParent()
        label.tapToBeginLabel.run(deleteTapToBeginLabel)
        let moveShipToRightPosition = SKAction.moveTo(y: self.size.height/7, duration: 1.5)
        let startLevelAction = SKAction.run(parametersLevel)
        let startLevelSequence = SKAction.sequence([moveShipToRightPosition, startLevelAction])
        planet.run(startLevelSequence)
    }
    
    
    
    func gameOver () {
        currentGameState = gameState.afterGame // le joueur a perdu on passe en afterGame
        self.removeAllActions()
        self.enumerateChildNodes(withName: "Bullet") {
            (bullet, stop) in
            bullet.removeAllActions()
        }
        self.enumerateChildNodes(withName : "Asteroid") {
            (asteroid, stop) in
            asteroid.removeAllActions()
        }
        let changeSceneToGameOverScene = SKAction.run(goToGameOverScene)
        let waitToChangeSceneToGameOverScene = SKAction.wait(forDuration: 0.5)
        let changeSceneToGameOverSceneSequence = SKAction.sequence([waitToChangeSceneToGameOverScene, changeSceneToGameOverScene])
        self.run(changeSceneToGameOverSceneSequence)
    }
/***********************************************************************************************************************************************************************************\
                                                Functions to Transite : GameOverScene, WinScene, PausedScene
\***********************************************************************************************************************************************************************************/
    
    func goToGameOverScene () {
        let sceneToMove_GameOver = GameOverScene(size: self.size)
        sceneToMove_GameOver.scaleMode = self.scaleMode
        let transitionScene = SKTransition.fade(withDuration: 1)
        self.view!.presentScene(sceneToMove_GameOver, transition: transitionScene)
    }
    
    //func goToWinScene ()
    //func goToPausedGame ()
    
/***********************************************************************************************************************************************************************************\
                                                            Functions Update
\***********************************************************************************************************************************************************************************/
    
    
    
    override func update(_ currentTime: TimeInterval) {
     
        if currentGameState == gameState.inGame {
            if lastUpdateTime == 0 {
                lastUpdateTime = currentTime
            
            }
            else {
                deltaFrameTime = currentTime - lastUpdateTime
                lastUpdateTime =  currentTime
            }
        
            let amounToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime)
            self.enumerateChildNodes(withName: "Background") {
                (background, stop) in
                background.position.y -= amounToMoveBackground
                if background.position.y < -self.size.height {
                    background.position.y += self.size.height*2
                }
            }
        }
    }
}



    

