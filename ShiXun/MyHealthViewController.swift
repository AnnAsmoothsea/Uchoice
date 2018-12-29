//
//  MyHealthViewController.swift
//  ShiXun
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit

class MyHealthViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var dataSource = Array<Dictionary<String,Any>>()
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.配置url
        let appid = "84309"
        let sign = "ac4c263538c5439bb2bd23468e352a58"
        let baseurl = "http://route.showapi.com/1658-1"
        let urlStr = "\(baseurl)?showapi_appid=\(appid)&showapi_sign=\(sign)"
        print(urlStr)
        let url = URL(string: urlStr)
        
        //2.配置request
        var request = URLRequest(url:url!)
        request.httpMethod = "GET"
        //3.创建会话
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            //解析data
            if error == nil {
                let jsondata = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String,Any>
                //print(jsondata as Any)
                if let boday = jsondata?["showapi_res_body"] as? Dictionary<String,Any>{
                    print(boday)
                    if let list = boday["list"] as? Array<Dictionary<String,Any>> {
                        self.dataSource = list
                        //刷新UI必须在主线程
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                        for dic in list {
                            print(dic["name"]!)
                        }
                    }
                }
            }
        }
        
        //4.执行任务
        task.resume()
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
extension MyHealthViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dic = dataSource[indexPath.row]
        if let name = dic["name"] {
            cell.textLabel?.text = name as! String
        }
        return cell
    }
}