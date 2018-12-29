//
//  MyAttentionViewController.swift
//  ShiXun
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit
struct UserInfo {
    var UserName: String
    var UserHeader:String
    var UserAttention:String
    var UserFans:String
    var UserLove:String
}
struct UserLogin {
    var UserName:String
    var UserPassword:String
}
struct Attention {
    var headerimage:String
    var name1:String
}
class MyAttentionViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    private var db: SQLiteDB!             // 数据库对象
    private var arrUserInfo = [UserInfo]()      // 保存所有用户数据
    private var arrUserLogin = [UserLogin]()  //保存用户登录数据
    private var arrAttention = [Attention]()  //保存关注的人信息
    override func viewDidLoad() {
        super.viewDidLoad()
        // 打开数据库
        db = SQLiteDB.shared        // 获取数据库单例对象
        _ = db.openDB()             // 打开数据库
//        var sql = "delete from  userInfo"
//        _ = db.execute(sql: sql)
       /* let name = "LiLu"
        let password = "123456"
        
        var sql = "insert into UserLogin(UserName, UserPassword) values('\(name)', '\(password)')"
        _ = db.execute(sql: sql)
        
        let name1 = "LiLu"
        let header = "starbucks_coffee_logo.png"
        let attention = "STY"
        let fans = "sty"
        let love = "宽窄巷子.jpg"
        sql = "insert into userInfo(UserName,UserHeader,UserAttention,UserFans,UserLove ) values('\(name1)', '\(header)', '\(attention)', '\(fans)', '\(love)')"
        _ = db.execute(sql: sql)*/
        readStuData()
        tableview.reloadData()
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
        arrAttention.removeAll()
        // 读取文件
        let name2 = "Liu"
        let sql = "select * from userInfo where UserName = '\(name2)'"
        let data = db.query(sql: sql)
        print(data)
        for item in data {
            let name = item["UserAttention"] as! String
            let image3 = item["UserHeader"] as! String
            //let name = item["stuName"] as! String
            let si = Attention(headerimage:image3, name1:name)
            arrAttention.append(si)
        }
        print(arrAttention)
        
    }
}

extension MyAttentionViewController:UITableViewDataSource,UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAttention.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gzcell",for:indexPath) as! gzTableViewCell
        //cell?.imageView?.image = UIImage(named: arrAttention[indexPath.row].headerimage)
        cell.gzLabel.text = arrAttention[indexPath.row].name1
        cell.gzImage.image = UIImage(named: "女孩头像.jpg")
        //cell?.imageView?.image = UIImage(named: arrAttention[indexPath.row].headerimage)
        //cell?.detailTextLabel?.text = arrUserInfo[indexPath.row].UserId as? String
        
        return cell
    }
    //设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
