//
//  GcDetailCwypViewController.swift
//  StyGc
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 邵天友. All rights reserved.
//

import UIKit

class GcDetailCwypViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
   
    
    var dataSource = Array<Dictionary<String,String>>()//数据源
    //
     var dataDic = Array<Dictionary<String, String>>()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            tableview.delegate = self
            tableview.dataSource = self
            initialzeDatasource()
            //print(dataSource)
            // Do any additional setup after loading the view.
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let strID = "cell_id2"
            var cell = tableView.dequeueReusableCell(withIdentifier: strID) as! GccwypTableViewCell?
            if cell == nil {
                cell = GccwypTableViewCell(style: .default, reuseIdentifier: strID)
            }
            
            let info = dataDic[indexPath.row]["phone"]
            let image = dataDic[indexPath.row]["image"]
            let add = dataDic[indexPath.row]["address"]
            //print(dataDic)
            //textView.text = info
           // imageview.image = UIImage(named: image!)
            cell?.headimage.image = UIImage(named: image!)
            cell?.address.text = "详情地址："+add!
            cell?.phone.text = "电话："+info!
            
            
            return cell!
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 160
        }
    
        func initialzeDatasource()->() {
            //读取文件信息
            //拿到路径
            let path = Bundle.main.path(forAuxiliaryExecutable: "Gcplist.plist")
            //判断路径是否存在
            let dataArray = NSArray(contentsOfFile: path!)
            //转成Array
            dataSource = dataArray as! Array
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            //得到下一个页面
            let detailVC = segue.destination as! Gclastcwyp2ViewController
            //得到点击的按钮
            let cell = sender as! GccwypTableViewCell
            //传递数据
            let indexPath = tableview.indexPath(for: cell)
            let data = dataSource[indexPath!.row]
            detailVC.dataDic = data
            //print(detailVC.dataDic)
        }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }*/
 
 
}

