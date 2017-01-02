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


}

