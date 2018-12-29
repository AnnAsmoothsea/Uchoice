//
//  TabBarViewController.swift
//  HomeP
//
//  Created by 邱洁琳 on 2018/12/28.
//  Copyright © 2018 邱洁琳. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false //避免受默认的半透明色影响，关闭
        self.tabBarItem.image = UIImage(named: "主页.png")
        
        self.tabBar.tintColor = UIColor(red: 0/255, green:188/255, blue:212/255, alpha:1) //设置选中颜色
        
        
        
        self.tabBar.barTintColor = UIColor(red: 241/255, green:148/255, blue:131/255, alpha:1)

        // Do any additional setup after loading the view.
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
