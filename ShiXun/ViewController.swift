//
//  ViewController.swift
//  StyGc
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 邵天友. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonindex = 0
    var dataSource = Array<Dictionary<String,String>>()//数据源
    @IBOutlet var buttons: [UIButton]!
    var mytimer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let timer = mytimer{
            timer.fireDate = Date.distantFuture
        }
    }
    
 
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let timer = mytimer{
            timer.fireDate = Date(timeIntervalSinceNow: 1)
        }
    }

    @objc func startAnimation()->(){
        //拿到按钮
        let button = buttons[buttonindex % buttons.count]
        //对s按钮进行动画操作
        UIView .transition(with: button, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.buttonindex += 1
        }, completion: nil)
    }
}

