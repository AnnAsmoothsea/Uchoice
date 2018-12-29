//
//  GzpageViewController.swift
//  ShiXun
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit
struct Attention2 {
    var name:String!
    var header:String!
    var image:String!
}
class GzpageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    private var db: SQLiteDB!             // 数据库对象
    var attention = [Attention2]()
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.shared        // 获取数据库单例对象
        _ = db.openDB()             // 打开数据库
        readStuData()
        tableview.reloadData()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(attention.count)
        return attention.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid",for:indexPath) as! GzpageTableViewCell
        print(attention)
        cell.userName.text = attention[indexPath.row].name
        cell.image1.image = UIImage(named: attention[indexPath.row].header)
        cell.image2.image = UIImage(named: attention[indexPath.row].image+".jpg")
        return cell
    }
    //设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    /*  @IBAction func btnAddAction(_ sender: UIButton) {
     //        let name = tfStuName.text!
     //        let id = tfStuID.text!
     
     //        if name == "" || id == "" {
     //            return
     //        }
     let id = "111"
     let name = "www"
     let sql = "insert into info(UserId, UserName) values('\(id)', '\(name)')"
     _ = db.execute(sql: sql)
     
     
     }*/
    
    func readStuData() {
        attention.removeAll()
        // 读取文件
        let name = "Liu"
        
        let sql = "select * from userInfo where UserName = '\(name)'"
        let data = db.query(sql: sql)
        //print(data)
        for item in data {
            let name1 = item["UserAttention"] as! String
            let header1 = item["UserHeader"] as! String
            let image1 = item["UserAttention"] as! String
            let si = Attention2(name: name1, header: header1,image:image1)
            attention.append(si)
        }
       // print(attention)
    }
}

