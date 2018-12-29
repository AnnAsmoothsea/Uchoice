//
//  MainTabBar.swift
//  ShiXun
//
//  Created by student on 2018/12/29.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.tabBar.isTranslucent = false  //避免受默认的半透明色影响，关闭

//        self.tabBar.barTintColor  = UIColor(red: 181/255, green:128/255, blue:119/255, alpha:1) //也可以自定义颜色
       
//        self.tabBarItem
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
