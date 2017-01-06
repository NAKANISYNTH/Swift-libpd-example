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

    @IBAction func triggerButtonAction(sender: AnyObject) {
        let list = ["trigger1", 1]
        PdBase.sendList(list, toReceiver: "g_message")
    }

    @IBAction func trigger2ButtonAction(sender: AnyObject) {
        let list = ["trigger2", 1]
        PdBase.sendList(list, toReceiver: "g_message")
    }
}

