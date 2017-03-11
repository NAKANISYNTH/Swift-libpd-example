//
//  ViewController.swift
//
//  Created by kyosuke on 2017/01/01.
//  Copyright © 2017年 kyosuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Player.sharedInstance.openPdFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeFreqSound1ButtonAction(_ sender: AnyObject) {
        PdBase.send(Float(arc4random()).truncatingRemainder(dividingBy: 800)+200, toReceiver: "g_freq")
    }
    
    @IBAction func bangSound1ButtonAction(_ sender: AnyObject) {
        PdBase.sendBang(toReceiver: "g_bang")
    }
    
    @IBAction func bangSound1WithListButtonAction(_ sender: AnyObject) {
        let list = ["sound1", "bang"]
        PdBase.sendList(list, toReceiver: "g_list")
    }

    @IBAction func bangSound2ButtonAction(_ sender: AnyObject) {
        let list = ["sound2", "bang"]
        PdBase.sendList(list, toReceiver: "g_list")
    }
    
}

