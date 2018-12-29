
//
//  MyViewController.swift
//  ShiXun
//
//  Created by 邱洁琳 on 2018/12/29.
//  Copyright © 2018 lilu. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SharedPreferences  attrreference = getSharedPreferences("count",MODE_WORLD_READABLE);
                        int count = attrreference.getInt("count", 0);
                    //判断程序与第几次运行，如果是第一次运行则跳转到引导页面
                        if (count == 0) {
                                    Intent intent = new Intent();
                                    intent.setClass(getApplicationContext(),GuideActivity.class);
                                    startActivity(intent);
                                    finish();
                            }
                        Editor editor = preferences.edit();
                        //存入数据
                        editor.putInt("count", ++count);
                        //提交修改
                        editor.commit();
        
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
