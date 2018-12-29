//
//  MyKindViewController.swift
//  ShiXun
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit

class MyKindViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var dataSource = Array<Dictionary<String,Any>>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1.配置url
        let appid = "84309"
        let sign = "ac4c263538c5439bb2bd23468e352a58"
        let baseurl = "http://route.showapi.com/341-2"
        let urlStr = "\(baseurl)?showapi_appid=\(appid)&showapi_sign=\(sign)"
        print(urlStr)
        let url = URL(string: urlStr)
        
        //2.配置request
        var request = URLRequest(url:url!)
        request.httpMethod = "GET"
        //3.创建会话
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            //            print(error)
            //            print(response)
            //            print(data)
            //解析data
            if error == nil {
                let jsondata = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String,Any>
                print(jsondata)
                if let boday = jsondata?["showapi_res_body"] as? Dictionary<String,Any>{
                    //                    if let result = boday["result"] as? Dictionary<String,Any> {
                    if let contentlist = boday["contentlist"] as? Array<Dictionary<String,Any>> {
                        self.dataSource = contentlist
                        //刷新UI必须在主线程
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                        for dic in contentlist {
                            print(dic["title"]!)
                        }
                    }
                }
            }
            
        }
        
        //4.执行任务
        task.resume()
    }
}
extension MyKindViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dic = dataSource[indexPath.row]
        if let name = dic["title"] {
            cell.textLabel?.text = name as! String
        }
        return cell
    }
}

