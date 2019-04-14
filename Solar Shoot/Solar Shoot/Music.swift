//
//  Musique.swift
//  shooter
//
//  Created by Mehir bitan on 03/04/2019.
//  Copyright © 2019 Dovratt bitan. All rights reserved.
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
    
    func musique(){
        //quelle son on veut choisir
        let filePath = Bundle.main.path(forResource: "Sound", ofType: "mp3")
        
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
    public func playMusique(){
        musique()
        backingAudio.play()
        setMusiqueActivee(valeur: true)
    }
    public func stopMusique (){
        musique()
        backingAudio.stop()
        setMusiqueActivee(valeur: false)
    }
    
    public func getMusiqueActivee() -> Bool{
        return musiqueActivee
    }
    
    public func setMusiqueActivee(valeur: Bool) {
        musiqueActivee = valeur
    }
}
