//
//  GcCwypViewController.swift
//  StyGc
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 邵天友. All rights reserved.
//

import UIKit

class GcCwypViewController: UIViewController {

   //点击宠物用品各个按钮跳转界面
    
    @IBOutlet var GCcwypButtons: [UIButton]!
    var buttonindex = 0
    var mytimer:Timer?
    var dataSource = Array<Array<Dictionary<String,String>>>()//数据源
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func startAnimation()->(){
        //拿到按钮
        let button = GCcwypButtons[buttonindex % GCcwypButtons.count]
        //对s按钮进行动画操作
        UIView .transition(with: button, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.buttonindex += 1
        }, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initialzeDatasource()
        if let timer = mytimer{
            timer.fireDate = Date(timeIntervalSinceNow: 1)
        }
    }
    
    func initialzeDatasource()->() {
        //读取文件信息
        //拿到路径
        
        let path = Bundle.main.path(forAuxiliaryExecutable: "CwypList.plist")
        //判断路径是否存在
        let dataArray = NSArray(contentsOfFile: path!)
        //转成Array
        dataSource = dataArray as! Array
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let timer = mytimer{
            timer.fireDate = Date.distantFuture
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
        
        //得到点击的按钮
        let button = sender as! UIButton
        
        if button.tag < 103 {
            //得到下一个页面
        let detailVC = segue.destination as! GcDetailCwypViewController
        //传递参数
        //传递数据
        let data = dataSource[button.tag-100]
        
        detailVC.dataDic = data
       // print(detailVC.dataDic)
        }
    
    }

}
