//
//  GameScene.swift
//  Solar Shoot V1
//
//  Created by Projet L2R1 on 19/02/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//
import SpriteKit
import GameplayKit

// On créer une extension qui permet le formattage d'un texte (qui sera utilisé pour le gameScore), créer un espace entre les milliers etc...
extension Formatter {
    static let WithSeparatorGameScene: NumberFormatter = {
        let spaceScore = NumberFormatter()
        spaceScore.groupingSeparator = " "
        spaceScore.numberStyle = .decimal
        return spaceScore
    } ()
}

//On utilise l'extension precedente afin de déclarer une variable qu'on utilisera par la suite
extension BinaryInteger {
    var formattedWithSeparatorGameScene: String {
        return Formatter.WithSeparatorGameScene.string(for: self) ?? ""
    }
}

//Cette variable est publique à toutes les scene, correspond au score du joueur
var gameScore = 0


//Cette variable est publique à toutes les scene
var lvlNumber : Int = 1
//let defaults1 = UserDefaults()
//set(_ value: lvlNumber1,forKey defaultName: "lvlNumber1")
//var lvlNumber = defaults1.integer(forKey: "lvlNumber1")


var lvlRequired : Int = 1 //Niveau requis pour accéder à un niveau
let gameScoreString = gameScore.formattedWithSeparatorGameScene // Déclaration du gameScoreString qui est en fait le gameScore formatter avec l'extension ci-dessus

let musique = Music(musiqueActivee: musiqueActivee) // Si la musique est activée, alors on rajoute la musique à la GameScene
let sons = Sons(sonsActivee: sonsActivee) // Si les sons sont activés, alors on rajoute les différents sont à la GameScene



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //déclaration des backgrounds en fonction des niveaux
    public var background1 = Background()
    public var background2 = Background()
    public var background3 = Background()
    public var background4 = Background()
    public var background5 = Background()
    public var background6 = Background()
    public var background7 = Background()
    public var background8 = Background()
    public var backgroundCarte = Background()
    
    private var play : Bool
    
    //On déclare toutes les planètes et l'icône de la planète (pour les points de vie) en fonctions des niveaux
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
    
    //On déclare les missiles et les astéroïdes
    private var bullet = Bullet()
    private var asteroide = Asteroide()
    
    private var label = Label()
    
    //On ajoute les boutons pause et exit
    var stopLabel = SKSpriteNode(imageNamed:"Pause")
    let exitLabel = SKSpriteNode(imageNamed:"exit")
    
    //On déclare plusieurs statuts de jeu
    enum gameState { // Permet de dire dans quel état est le jeu
        case preGame // avant le début du niveau
        case inGame // pendant le niveau
        case StopedGame // si le joueur fait pause
        case afterGame // après le niveau ––> gagné ou perdu
    }
    
    //Dès qu'on arrive dans la game scene, on est en preGame qui permet le défillement du label
    var currentGameState = gameState.preGame //Ici on indique on fixe la valeur à inGame ; on pourrait passé avec un Int pour les status mais cela porterait à confusion
    
    //On donne à chaque objet, une valeur en binaire pour la physic
    struct physicsCategories { // On affecte à chaque objet, une valeur binaire
        static let none : UInt32 = 0
        static let planet : UInt32 = 0b1 // 1 en binaire, la planète est donc un Unsigned Int ayant pour valeur 1
        static let bullet : UInt32 = 0b10 // 2 en binaire, les missiles sont donc des Unsigned Int ayant pour valeur 2
        static let asteroid: UInt32 = 0b100 // 4 en binaire, les astéroïdes sont donc des Unsigned Int ayant pour valeur 4
    }
    
    //Le joueur possède 3 points de vie
    var pointLife = 3
    
    //On déclare le booléen en faux, et la cadence de tirs
    private var fireBool = false
    private var fireInterval: Double = 0.2
    
    //On ajoute les variables lastUpdateTime, deltaFrametime et updateTime pour la fonction Update
    private var updateTime: Double = 0
    var lastUpdateTime : TimeInterval = 0
    var deltaFrameTime : TimeInterval = 0
    
    //Vitesse du défilement du background
    var amountToMovePerSecond : CGFloat = 800.0
    
    //Ici on créé le rectangle pour la zone de jeu du déplacement de la planète
    public let gameArea : CGRect
    override init (size : CGSize) {
        //On définit le ration d'un écran en tant que 16/9ème, même si pas très optimiser pour les anciens forms factor d'Apple
        let maxRatioAspect: CGFloat =  16.0 / 9.0
        let widthPlayable = size.height / maxRatioAspect
        let widthMargin =  (size.width - widthPlayable) / 2
        let heightPlayable = size.width / maxRatioAspect
        let heightMargin = (size.height - heightPlayable) / 1000
        
        //la zone de déplacement de la planète est définitit en tant que rectant
        gameArea = CGRect(x: widthMargin, y: heightMargin, width: widthPlayable, height: heightPlayable)
        play.self = true
        super.init(size: size)
    }
    
    //Required init (obligatoire)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Appel de la fonction addAsteroid de la classe astéroïde pour afficher les astéroïdes
    func asteroids (){
        asteroide.addAsteroid(imageName:"Asteroid" , parent: self)
    }
    

    func Level(x:Int,eparpillement:Double) {
        let spawn = SKAction.run(asteroids)//Crée une action qui exécute un bloc, ici les asteroides
        let waitSpawn = SKAction.wait(forDuration: eparpillement)//Le temps d'apparition d'un astéroïdes dépend de la variable eparpillement
        let sequence = SKAction.sequence([waitSpawn,spawn])//sequence:asteroides+ temps en seconde de spawn entre chaque astéroïdes
        let spawnForever = SKAction.repeat(sequence, count: x)//Pour repeter la sequence
        self.run(spawnForever, completion: {() -> Void in self.transition(newScene: WinScene(size: self.size))}) //On exécute le bloc d'action
        
    }
    
    //Création d'une fonction pour les transitions de la gameScene vers une autre scène
    func transition(newScene: SKScene){
        let scene = newScene
        scene.scaleMode = self.scaleMode
        let Transition = SKTransition.reveal(with: .down, duration: 1.5)
        self.view!.presentScene(scene, transition:Transition)
    }
    
    //caractéristiques de chaque niveau
    func LevelCaracteristic(){
        switch lvlSelected {
        case 1 :
            Level(x:100, eparpillement: 0.6) // x = nombres d'astéroïdes par niveau
            break
        case 2 :
            Level(x:150, eparpillement: 0.55)
            break
        case 3 :
            Level(x:200, eparpillement: 0.50)
            break
        case 4 :
            Level(x:250, eparpillement: 0.45)
            break
        case 5 :
            Level(x:300, eparpillement: 0.40)
            break
        case 6 :
            Level(x:350, eparpillement: 0.35)
            break
        case 7 :
            Level(x:400, eparpillement: 0.30)
            break
        case 8 :
            Level(x:450, eparpillement: 0.20)
            break
        default :
            planet.addPlanet(parent: self)
            planet.phys()
            planetIcon.addPlanet(parent: self)
            break
        }
    }
    
    
    override func didMove(to view: SKView) {
        
        //Permet de mettre la musique en fonction de si on l'a activer ou non
        if(musique.getMusiqueActivee()){
            musique.playMusique(NameMusique: "MusiqueGameScene")
        }
        else {
            musique.stopMusique(NameMusique: "MusiqueGameScene")
        }
        gameScore = 0 //On réinitialise le gameScore à 0, sinon "garderait" le score d'avant
        self.physicsWorld.contactDelegate = self
        
        for i in 0...1 {
            //Affichage de background différents pour chaque niveau
            switch lvlSelected {
            case 1 :
                label.afficherBackground(imageName: "Fond_Mercure", parent: self, background: background1, j: i)
                break
            case 2 :
                label.afficherBackground(imageName: "Fond_Venus", parent: self, background: background2, j: i)
                break
            case 3 :
                label.afficherBackground(imageName: "Fond_Terre", parent: self, background: background3, j: i)
                break
            case 4 :
                label.afficherBackground(imageName: "Fond_Mars", parent: self, background: background4, j: i)
                break
            case 5 :
                label.afficherBackground(imageName: "Fond_Jupiter", parent: self, background: background5, j: i)
                break
            case 6 :
                label.afficherBackground(imageName: "Fond_Saturne", parent: self, background: background6, j: i)
                break
            case 7 :
                label.afficherBackground(imageName: "Fond_Uranus", parent: self, background: background7, j: i)
                break
            case 8 :
                label.afficherBackground(imageName: "Fond_Neptune", parent: self, background: background8, j: i)
                break
            default:
                label.afficherBackground(imageName: "Carte", parent: self, background: backgroundCarte, j: i)
                break
                
            }
        }
        //Affichage de planètes différentes pour chaque niveau
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
        
        
        
        //Affichage vies
        label.AffichageLabel(label: label.gameScoreLabel, text: "0", fontS: 50, horAlign: SKLabelHorizontalAlignmentMode.left, xW: 0.20,parent: self)
        label.AffichageLabel(label: label.xPointLifeLabel, text: "x", fontS: 30, horAlign: SKLabelHorizontalAlignmentMode.right, xW: 0.73,parent: self)
        label.AffichageLabel(label: label.pointLifeLabel, text: "3", fontS: 50, horAlign: SKLabelHorizontalAlignmentMode.right, xW: 0.75,parent: self)
        
        
        //Apparition des éléments sur l'écran
        let moveToScreen = SKAction.moveTo(y: self.size.height*0.9, duration: 1.5) //Action qui déplace sur l'axe des Y
        label.gameScoreLabel.run(moveToScreen) //Le gameScore exécute le move
        label.xPointLifeLabel.run(moveToScreen) //Le x du gameScore exécute le move
        label.pointLifeLabel.run(moveToScreen) //Le int exécute le move
        planetIcon.run(moveToScreen) //L'icône de la planète exécute le move
        
        //Appel de la fonction qui fait apparaîte le label avant de commencer le niveau
        label.phrasePreGame(parent:self,label : label.tapToBeginLabel)
        
        let scrollRightToLeft = SKAction.moveTo(x: -self.size.width*0.5, duration: 8) //le label se déplace vers la gauche
        let resetScroll = SKAction.moveTo(x: label.tapToBeginLabel.position.x, duration: 0) //On reset le scrool, on le repositionne sur le côté droit de l'écra
        let scrollSequence = SKAction.sequence([scrollRightToLeft, resetScroll]) //On créer la séquence = scroll à gauche + repositionnement
        let scrollSequenceRepeat = SKAction.repeatForever(scrollSequence) //On exécute cette fonction à l'infini (du moins jusqu'à ce que le joueur tape sur l'écran)
        label.tapToBeginLabel.run(scrollSequenceRepeat) //Le label exécute la Séquence (donc en forever)
        
        stopLabel.setScale(0.20) //On diminue la taille du StopLabel
        stopLabel.position = CGPoint(x: self.size.width/1.3 , y: self.size.height/18) // On le positionne
        stopLabel.zPosition = 100 //On le place à un grand Z position afin qu'il soit devant le reste du jeu
        stopLabel.name="boutonPause" //On donne à ce Sprite le nom de boutonPause
        self.addChild(stopLabel)//On l'ajoute à la scène
        
        exitLabel.setScale(0.05) // On diminue la taille du bouton exit
        exitLabel.position = CGPoint(x: self.size.width/4 , y: self.size.height/18) //On le positionne
        exitLabel.zPosition = 100 // On le place à un grand Z position afin qu'il soit devant le reste du jeu
        exitLabel.name="boutonExit" // On donne à ce Sprite le nom de boutonExit
        self.addChild(exitLabel) //On l'ajoute à la scène
        
        
    }
    
    //On utilise la classe Bullet pour utlisé les missiles
    func fireBullet () {
        bullet.addBullet(imageName: "Bullet", parent: self, player: planet)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Dès que le joueur appuie sur l'écran, on vérifie l'état du jeu puis on lance le niveau grace à la fonction gameStart
        if currentGameState == gameState.preGame {
            gameStart()
        }
        //Autrement, si le joueur "est en action" alors si l'appuie sur l'écran, le booléan pour tirer en continue passe en true (sert pour la fonction update)
        else if currentGameState == gameState.inGame {
            fireBool = true
        }
        
        //Pour tout objet toucher l'écran
        for touch: AnyObject in touches{
            let toucher = touch.location(in:self)
            let nodeTapped = atPoint (_:toucher)
            
            //si on clique sur le bouton play/pause
            if (nodeTapped.name  == "boutonPause"){
                
                //et que le jeu est en mode play le jeu se met en mode pause
                if(play){
                    play = false
                    let pauseAction = SKAction.run{
                        self.view?.isPaused = true
                    }
                    self.run(pauseAction)
                    
                }
                    //et que le jeu est en mode pause le jeu se met en mode play
                else{
                    play=true
                    self.view?.isPaused = false
                    
                }
                
                //caractéristiques du bonton pause
                stopLabel = SKSpriteNode(imageNamed:"Pause")
                stopLabel.setScale(0.20) //On diminue la taille du stopLabel
                stopLabel.position = CGPoint(x: self.size.width/1.3, y: self.size.height/18) //On le positionne
                stopLabel.zPosition = 100 // On lui met un grand Z position afin qu'il soit "au dessus de tout" dans le jeu
                stopLabel.name="boutonPause" // On donne à ce Sprite le nom de "boutonPause"
                self.addChild(stopLabel) // On l'ajoute à la scène
            }
            
            if (nodeTapped.name  == "boutonExit"){ // Si endroit_Touché = bouton exit
                let scene = ExitScene(size: self.size) // Transition vers la ExitScene
                scene.scaleMode = self.scaleMode
                let Transition = SKTransition.reveal(with: .down, duration: 1.5)
                self.view!.presentScene(scene, transition:Transition)
            }
        }
    }
    
    //Dès que le joueur arrête d'appuyer sur l'écran, le booléan pour le tir continue passe en valeur false
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireBool = false
    }
    
    //Déplacement de la planète
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { //Fonction prédéfinie pour le déplacement
        for touch : AnyObject in touches { // Pour tout objet toucher
            let pointOfTouch = touch.location(in: self) // futur position à la frame+1
            let previousPointOfTouch = touch.previousLocation(in: self) // position actuelle, à la frame
            
            // "Somme" du déplacement en x = valeur de la on a appuyé (futur position à frame+1) - position actuelle (à la frame actuelle)
            let amountDraggedX = pointOfTouch.x - previousPointOfTouch.x
            
            // "Somme" du déplacement en y = valeur de la on a appuyé (futur position à frame+1) - position actuelle (à la frame actuelle)
            let amountDraggedY = pointOfTouch.y - previousPointOfTouch.y
            
            //On vérifie une fois de plus qu'on est dans l'état "en jeu"
            if currentGameState == gameState.inGame {
                planet.position.x += amountDraggedX // On ajoute la somme (quelle soit positive ou négative) à la position actuelle en x de la planète
                planet.position.y += amountDraggedY // On ajoute la somme (quelle soit positive ou négative) à la position actuelle en y de la planète
            }
            
            //Si la position de la planète en x dépasse zone max en x de la gameArea alors on divise la planète en deux au maximum
            if planet.position.x > gameArea.maxX - planet.size.width / 2 {
                planet.position.x = gameArea.maxX - planet.size.width / 2
            }
            
            //Raisonnement similaire pour le cas où la position en x est inférieur à la zone min en x de la gameArea
            if planet.position.x < gameArea.minX + planet.size.width / 2 {
                planet.position.x = gameArea.minX + planet.size.width / 2
            }
            
            //Raisonnement identique à celui pour l'axe des x
            if planet.position.y > gameArea.maxY - planet.size.height / 2  {
                planet.position.y = gameArea.maxY - planet.size.height / 2
            }
            if planet.position.y < gameArea.minY + planet.size.height / 2 {
                planet.position.y = gameArea.minY + planet.size.height / 2
            }
        }
    }
    
    //déclaration de collision & crash
    func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody() // On définit un corps1, qui possède un physic
        var body2 = SKPhysicsBody() // On définit un corps2
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask { // Si la valeur affecté à un corpsA est inférieur à celle d'un corpsB alors
            body1 = contact.bodyA // le body1 correspond au corps A
            body2 = contact.bodyB // le body 2 correspond au corps B
        }
        else { // Dans l'autre cas (si valeur de corpsA > corpsB), on inverse l'affectation
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        //Si le body 1 correspond à la planète et le body 2 à un astéroïde
        if body1.categoryBitMask == physicsCategories.planet && body2.categoryBitMask == physicsCategories.asteroid {
            //Si un astéroide touche la planète
            lifePoint() // Le joueur perd un point de vie
            if body1.node != nil && pointLife == 0 { // nil comme NULL ; On créer l'explosion de la planète uniquement si pointLife = 0
                spawnExplosion(spawnPosition: body1.node!.position)
            }
            if body2.node != nil {
                spawnExplosion(spawnPosition : body2.node!.position) //On créer une explosion de l'astéroïde
            }
            if pointLife == 0 { //Si le joueur n'a plus de point de vie
                body1.node?.removeFromParent() // On supprime l'image de la planète de l'écran
                gameOver() // On appelle la fonction gameOver afin de mettre la gameScene en "pause"
            }
            body2.node?.removeFromParent() //On supprime le Sprite2 de la scène
            
        }
        
        //Si le body1 correspond à un missile et le body2 à un astéroïde
        if body1.categoryBitMask == physicsCategories.bullet && body2.categoryBitMask == physicsCategories.asteroid {
            //Si le missile touche un astéroïde
            addScore() // On ajoute un point au gameScore
            if body2.node != nil{ // Si la valeur de l'astéroïde n'est pas nul
                if body2.node!.position.y > self.size.height{ // Si le body 2 dépasse la taille de l'écran
                    return // On le renvoie à la suite directement
                }
                else{
                    spawnExplosion(spawnPosition: body2.node!.position) // Sinon on le fait explosé
                }
            }
            body1.node?.removeFromParent() // On supprime le body1
            body2.node?.removeFromParent() // On supprime le body2
        }
        
        
    }
    
    //Création de la fonction explosion
    func spawnExplosion (spawnPosition : CGPoint) {
        let explosion = SKSpriteNode(imageNamed: "Explosion") // On définit le Sprite
        explosion.position = spawnPosition // L'explosion se produit à l'endroit définit
        explosion.zPosition = 3 //On lui donne un plus grand Z position que les misilles et les astéroïdes
        explosion.setScale(0.2) //On diminue la taille du Sprite
        self.addChild(explosion) // On l'ajoute à la scène
        let scaleIn = SKAction.scale(to: 0.9, duration: 0.2) // Lors de son apparition il passe de 0.2 à 0.9 en 0.2 seconde
        let fadeOut = SKAction.fadeOut(withDuration: 0.1) // On lui fait ensuite reprendre sa taille notemal en 0.1 seconde
        let deleteExplosion = SKAction.removeFromParent() // Une fois cela fait, on le supprime de la scène
        if(sons.getSonsActivee()){ // Si les sons sont activés
            let explosionSequence = SKAction.sequence([sons.getExplosionSound(), scaleIn, fadeOut, deleteExplosion]) // Alors on exécute cette séquence
            explosion.run(explosionSequence) // le Sprite effectue l'explosionSequence
        }
        else{ // Si les sons sont désactivés
            let explosionSequence = SKAction.sequence([scaleIn, fadeOut, deleteExplosion]) // On fait une autre séquence sans jouer les sons
            explosion.run(explosionSequence) // le Sprite effectue cette Explosion Sequence
        }
        
    }
    
    
    //fonction pour le score
    func addScore () {
        gameScore += 1 // On rajoute +1 au score lorsqu'un missile touche un astéroïde
        label.gameScoreLabel.text = "\(gameScore.formattedWithSeparatorGameScene)" // Affichage du labelScore avec la variable gameScore.formattedWithSeperatorGameScene
    }
    
    //fonction pour la perte de point de vie
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
    
    //fonction qui permet le lancement du jeu
    func gameStart () {
        currentGameState = gameState.inGame // On définit l'état du jeu comme étant "in"
        let deleteTapToBeginLabel = SKAction.removeFromParent() // On supprime le défilement du texte qui est présent avant de commencer le niveau
        label.tapToBeginLabel.run(deleteTapToBeginLabel) // La variable tapToBeginLabel exécute la suppresion (deleteTapToBeginLabel)
        let moveShipToRightPosition = SKAction.moveTo(y: self.size.height/7, duration: 1.5) // On fait apparaître la Terre à sa position progressivement
        let startLevelAction = SKAction.run(LevelCaracteristic) // On démarre un niveau définit par la variable LevelCaracteristic
        let startLevelSequence = SKAction.sequence([moveShipToRightPosition, startLevelAction]) // Séquence de démarrage d'un niveau = apparition planète + lancement niveau
        planet.run(startLevelSequence) // La planète exécute la séquence
    }
    
    
    //fonction Game Over quand le joueur perd une partie
    func gameOver () {
        currentGameState = gameState.afterGame // le joueur a perdu on passe en afterGame
        self.removeAllActions() // On stoppe toutes les actions en cours
        self.enumerateChildNodes(withName: "Bullet") {
            (bullet, stop) in
            bullet.removeAllActions() // On stoppe tous les missiles qui sont en actions, on les fige
        }
        self.enumerateChildNodes(withName : "Asteroid") {
            (asteroid, stop) in
            asteroid.removeAllActions() // Même raisonnement que pour les missiles, mais ici ce sont les astéroïdes
        }
        let changeSceneToGameOverScene = SKAction.run(goToGameOverScene) // On passe à la gameOverScene
        let waitToChangeSceneToGameOverScene = SKAction.wait(forDuration: 0.5) // Un petit délais avant de passer à la GameOverScene
        let changeSceneToGameOverSceneSequence = SKAction.sequence([waitToChangeSceneToGameOverScene, changeSceneToGameOverScene]) // Séquence = délais + transition vers GameOverScene
        self.run(changeSceneToGameOverSceneSequence) // On fait exécuter la séquence à la scène
    }
    
    //Transition pour aller dans la Game Over Scene
    func goToGameOverScene () {
        let sceneToMove_GameOver = GameOverScene(size: self.size)
        sceneToMove_GameOver.scaleMode = self.scaleMode
        let transitionScene = SKTransition.fade(withDuration: 1)
        self.view!.presentScene(sceneToMove_GameOver, transition: transitionScene)
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        guard fireBool else { return } //Permet de vérifier que la variable fireBool n'est pas nulle
        
        //si le temps entre la dernière m.à.j de frame et la frame actuelle est supérier au FireInterval alors on tire automatiquement un missile
        if currentTime - updateTime > fireInterval {
            self.fireBullet()
            updateTime = currentTime // dernière m.à.j de frame est égale à celle actuelle
        }
        
        if currentGameState == gameState.inGame { //On vérifie qu'on soit bien dans le jeu
            if lastUpdateTime == 0 {
                lastUpdateTime = currentTime
                updateTime = currentTime
                
            }
            else {
                deltaFrameTime = currentTime - lastUpdateTime
                lastUpdateTime =  currentTime
            }
            
            let amounToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime) //"Somme à bouger" (background)
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






