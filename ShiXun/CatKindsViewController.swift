//
//  CatKindsViewController.swift
//  HomeP
//
//  Created by 邱洁琳 on 2018/12/28.
//  Copyright © 2018 邱洁琳. All rights reserved.
//

import UIKit

class CatKindsViewController: UIViewController {

    @IBOutlet weak var CatKindsTableview: UITableView!
    
    //定义一个数据源
    var dataSource  = Array<Dictionary<String,String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDataSourse()
        // Do any additional setup after loading the view.
    }
    
    
    //用object—C来获取本地数据
    func initializeDataSourse() ->(){
        //读取文件信息
        //获取文件路径
        let path = Bundle.main.path(forAuxiliaryExecutable: "CatKinds.plist")
//        let path = Bundle.main.path(forResource: "Catkinds", ofType: "plist")
        //注意：需要判断该文件是否存在 （此处时省略）
        let dataArray = NSArray(contentsOfFile: path!)
        //转换成Array
        dataSource = dataArray as!Array
        print(dataSource)
        
//        CatKindsTableview .reloadData()
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //得到下一个页面
        let detailVC = segue.destination as! CatKindsDetailViewController
        //得到点击cell
        let cell = sender as! CatKindsTableViewCell
        //传递数据
        let indexPath = CatKindsTableview.indexPath(for: cell)
        let data = dataSource[indexPath!.row]
        detailVC.dataDic = data 
        
    }

}

extension CatKindsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //行数（与数据源个数相关）
        return dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Catcell",for:indexPath) as! CatKindsTableViewCell
        let dataDic = dataSource[indexPath.row]
        cell.catImage.image = UIImage(named: dataDic["image"]!)
        cell.nameLabel.text = dataDic["name"]
        cell.detailLabel.text = dataDic["detail"]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
