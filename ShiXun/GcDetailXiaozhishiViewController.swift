//
//  GcDetailXiaozhishiViewController.swift
//  StyGc
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 邵天友. All rights reserved.
//

import UIKit

class GcDetailXiaozhishiViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var dataDic = Dictionary<String,String>()
    override func viewDidLoad() {
        super.viewDidLoad()

        let info = dataDic["info"]
        let image = dataDic["image"]
        //print(dataDic)
        textView.text = info
        imageview.image = UIImage(named: image!)
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
