//
//  PoKemonWebViewController.swift
//  HomeP
//
//  Created by 邱洁琳 on 2018/12/28.
//  Copyright © 2018 邱洁琳. All rights reserved.
//

import UIKit

class PoKemonWebViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建WebView并添加
        let webView = UIWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        let url = URL(string: "https://mp.weixin.qq.com/s/-3ahlyczT396x41R8DEKUw")
        let urlRequest = NSURLRequest(url: url!)//创建URL请求
        webView.loadRequest(urlRequest as URLRequest)//载入URL请求
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
