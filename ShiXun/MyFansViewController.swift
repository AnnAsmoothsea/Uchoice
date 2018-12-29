//
//  MyFansViewController.swift
//  ShiXun
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit
struct Fans {
    var headerImage:String
    var Label:String
}
class MyFansViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var tableview: UITableView!
    var arrFans = [Fans]()
    private var db: SQLiteDB! 
    override func viewDidLoad() {
        super.viewDidLoad()
        // 打开数据库
        db = SQLiteDB.shared        // 获取数据库单例对象
        _ = db.openDB()             // 打开数据库
        readStuData()
        tableview.reloadData()
        tableview.delegate = self
        tableview.dataSource = self
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fansCell") as! MyfansTableViewCell
        cell.fansImage.image = UIImage(named: arrFans[indexPath.row].headerImage)
        cell.fansLabel.text = arrFans[indexPath.row].Label
        //cell?.detailTextLabel?.text = arrUserInfo[indexPath.row].UserId as? String
        
        return cell
    }
    //设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func readStuData() {
        arrFans.removeAll()
        // 读取文件
//        let sql1 = "delete from userInfo"
//        _ = db.execute(sql: sql1)
        let name = "Liu"
        let sql = "select * from userInfo where UserName = '\(name)'"
        let data = db.query(sql: sql)
        for item in data {
            let name = item["UserFans"] as! String
            let image = item["UserHeader"] as! String
            let si = Fans(headerImage: image, Label: name)
            arrFans.append(si)
        }
        print(arrFans)
    }

    
}
