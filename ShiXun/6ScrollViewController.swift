//
//  6ScrollViewController.swift
//  HomeP
//
//  Created by 邱洁琳 on 2018/12/28.
//  Copyright © 2018 邱洁琳. All rights reserved.
//

import UIKit

class _ScrollViewController: UIViewController {

    @IBOutlet weak var SixScroll: UIScrollView!
    private var db: SQLiteDB!             // 数据库对象
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.shared        // 获取数据库单例对象
        _ = db.openDB()             // 打开数据库
        // 设置滚动视图的内容尺寸
        SixScroll.contentSize = CGSize(width: 3840.0 / 2.6, height: 2400.0 / 2.6)
        
        // 隐藏水平与垂直指示条
        SixScroll.showsVerticalScrollIndicator = false
        SixScroll.showsHorizontalScrollIndicator = false
        
        // 创建一个图片对象
        let image = UIImage(named: "6岛岛的狗.jpg")
        
        // 创建图片视图对象
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 1380.0 / 2.6, height: 1380.0 / 2.6))
        imageView.image = image
        
        // 将图片视图添加到滚动视图
        SixScroll.addSubview(imageView)
    }
    @IBAction func GzButton(_ sender: Any) {
        var name1 = "Liu"
        var header = "女孩头像.jpg"
        var fans = "6岛岛的狗"
        var attention = "6岛岛的狗"
        let sql2 = "select * from userInfo where UserName = '\(name1)' AND UserAttention = '\(attention)'"
        let data2 = db.query(sql: sql2)
        print(data2)
        if data2.count == 0 {
            //var sex = "女孩.jpg"
            // let love = "宽窄巷子.jpg"
            var sql = "insert into userInfo(UserName,UserHeader,UserAttention,UserFans) values('\(name1)', '\(header)', '\(attention)','\(fans)')"
            _ = db.execute(sql: sql)
            name1 = "6岛岛的狗"
            header = "男孩头像.jpg"
            attention = "Liu"
            fans = "Liu"
            sql = "insert into userInfo(UserName,UserHeader,UserAttention,UserFans) values('\(name1)', '\(header)', '\(attention)','\(fans)')"
            _ = db.execute(sql: sql)
            let alertCtrl = UIAlertController(title: "已关注", message: "", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "好", style: .cancel, handler: nil)
            alertCtrl.addAction(cancelAction)
            present(alertCtrl, animated: true, completion: nil)
        }
        else{
            
            let alertCtrl = UIAlertController(title: "关注过啦", message: "", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "好", style: .cancel, handler: nil)
            alertCtrl.addAction(cancelAction)
            present(alertCtrl, animated: true, completion: nil)
        }
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
