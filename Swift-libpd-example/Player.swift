//
//  Player.swift
//
//  Created by kyosuke on 2017/01/02.
//  Copyright © 2017年 kyosuke. All rights reserved.
//
import libpd

class Player : NSObject, PdReceiverDelegate{
    
    let audioController = PdAudioController() // PureData
    var pdPointer:UnsafeMutableRawPointer?
    
    
    class var sharedInstance : Player {
        struct Static {
            static let instance : Player = Player()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(AVAudioSessionRouteChange(notification:)), name: AVAudioSession.routeChangeNotification, object: nil)
    }
    
    func openPdFile(){
        print(AVAudioSession.sharedInstance().currentRoute.outputs)
        print("preferredSampleRate:",AVAudioSession.sharedInstance().preferredSampleRate)
        print("sample rate:",AVAudioSession.sharedInstance().sampleRate)
        let sampleRate = AVAudioSession.sharedInstance().sampleRate
        audioController?.configurePlayback(withSampleRate: Int32(sampleRate), numberChannels: 2, inputEnabled: false, mixingEnabled: true)
        audioController?.isActive = true
        
        if pdPointer == nil {
            
            pdPointer = PdBase.openFile("main.pd", path: Bundle.main.resourcePath)
            print("open pd file")
        }
    }
    
    func closePdFile(){
        if pdPointer != nil{
            PdBase.closeFile(pdPointer!)
            pdPointer = nil
            print("close pd file")
        }
        audioController?.isActive = false
    }
    
    @objc func AVAudioSessionRouteChange(notification:Notification) {
        print(AVAudioSession.sharedInstance().currentRoute.outputs)
        print("preferredSampleRate:",AVAudioSession.sharedInstance().preferredSampleRate)
        print("sample rate:",AVAudioSession.sharedInstance().sampleRate)
        
        
        let sampleRate = AVAudioSession.sharedInstance().sampleRate
        audioController?.configurePlayback(withSampleRate: Int32(sampleRate), numberChannels: 2, inputEnabled: false, mixingEnabled: true)
    }
}
