//
//  GcShouyangViewController.swift
//  StyGc
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 邵天友. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
   
   
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
class GcShouyangViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
  
   
    var dataSource = Array<Dictionary<String,String>>()//数据源
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
        let strID = "cell_id"
        var cell = tableView.dequeueReusableCell(withIdentifier: strID) as! CustomCell?
        if cell == nil {
            cell = CustomCell(style: .default, reuseIdentifier: strID)
        }
        
       
        cell?.myImageView.image = UIImage(named: dataSource[indexPath.row]["image"]!)
        cell?.info.text = dataSource[indexPath.row]["info"]!
       
   
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
        let detailVC = segue.destination as! GcDetailXiaozhishiViewController
        //得到点击的按钮
        let cell = sender as! CustomCell
        //传递数据
        let indexPath = tableview.indexPath(for: cell)
        let data = dataSource[indexPath!.row]
        detailVC.dataDic = data
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
