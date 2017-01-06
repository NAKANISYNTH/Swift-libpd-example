//
//  Player.swift
//
//  Created by kyosuke on 2017/01/02.
//  Copyright © 2017年 kyosuke. All rights reserved.
//

class Player : NSObject, PdReceiverDelegate{
    
    let audioController = PdAudioController() // PureData
    var pdPointer:UnsafeMutablePointer<Void>?
    
    
    class var sharedInstance : Player {
        struct Static {
            static let instance : Player = Player()
        }
        return Static.instance
    }
    
    func openPdFile(){
        audioController.configurePlaybackWithSampleRate(44100, numberChannels: 2, inputEnabled: false, mixingEnabled: true)
        audioController.active = true
        
        if pdPointer == nil {
            
            pdPointer = PdBase.openFile("main.pd", path: NSBundle.mainBundle().resourcePath)
            print("open pd file")
        }
    }
    
    func closePdFile(){
        if pdPointer != nil{
            PdBase.closeFile(pdPointer!)
            pdPointer = nil
            print("close pd file")
        }
        audioController.active = false
    }
    
}
