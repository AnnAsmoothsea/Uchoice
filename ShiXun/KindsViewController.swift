//
//  KindsViewController.swift
//  HomeP
//
//  Created by 邱洁琳 on 2018/12/28.
//  Copyright © 2018 邱洁琳. All rights reserved.
//

import UIKit

class KindsViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    var  buttonIndex = 0
    var  mytimer : Timer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let timer = mytimer{
            timer.fireDate = Date(timeIntervalSinceNow: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         mytimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
    }
    
    @objc func startAnimation() -> (){
        //拿到按钮
        let index = buttonIndex % buttons.count
        let button = buttons[index]
        //对按钮进行操作
        UIView .transition(with: button, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.buttonIndex += 1
        }, completion: nil)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
