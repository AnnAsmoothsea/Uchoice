//
//  Gclastcwyp2ViewController.swift
//  StyGc
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 邵天友. All rights reserved.
//

import UIKit

class Gclastcwyp2ViewController: UIViewController {

    
    var dataDic = Dictionary<String,String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(dataDic)
        let Url = dataDic["url"]
     
        //创建WebView并添加
        let webView = UIWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        let url = URL(string:Url!)
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
