//
//  Musique.swift
//  shooter
//
//  Created by Projet L2R1 on 03/04/2019.
//  Copyright © 2019 Projet L2R1. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

var musiqueActivee = true

class Music {
    
    public var backingAudio: AVAudioPlayer
    public var musiqueActivee: Bool
    
    init(musiqueActivee: Bool){
        backingAudio = AVAudioPlayer()
        self.musiqueActivee = musiqueActivee
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //musique
    func musique(NameMusique: String){
        //quelle son on veut choisir
        let filePath = Bundle.main.path(forResource: NameMusique, ofType: "mp3")
        
        //extraction de l'audio
        let audioNSURL = NSURL.init(fileURLWithPath: filePath!)
        
        //on essay douvrir l'odio mais si on n'arrive pas on prévient l'utilisateur qu'on ne trouve pas l'audio
        do {
            backingAudio = try AVAudioPlayer(contentsOf: audioNSURL as URL)
            
        }
        catch {
            return print("Cannot Find The Audio")
        }
        //si on veut executer l'odio toujours on met -1 sinon on mlet le nbr de fois qu'on veut l'executer
        backingAudio.numberOfLoops = -1
        
    }
    
    //La musique se met en marche
    public func playMusique(NameMusique: String){
        musique(NameMusique: NameMusique)
        backingAudio.play()
        setMusiqueActivee(valeur: true)
    }
    
    //la musique s'arrete
    public func stopMusique (NameMusique: String){
        musique(NameMusique: NameMusique)
        backingAudio.stop()
        setMusiqueActivee(valeur: false)
    }
    
    //Permet de savoir si la musique est activée
    public func getMusiqueActivee() -> Bool{
        return musiqueActivee
    }
    
    //Modifie la valeur de musiqueActivee par la valeur entrée en paramètre
    public func setMusiqueActivee(valeur: Bool) {
        musiqueActivee = valeur
    }
}
