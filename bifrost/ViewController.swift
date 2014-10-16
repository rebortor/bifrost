//
//  ViewController.swift
//  bifrost
//
//  Created by Rebort on 14-10-16.
//  Copyright (c) 2014年 motorcycle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(GameView(frame: self.view.bounds))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

