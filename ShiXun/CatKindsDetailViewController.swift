//
//  CatKindsDetailViewController.swift
//  HomeP
//
//  Created by 邱洁琳 on 2018/12/28.
//  Copyright © 2018 邱洁琳. All rights reserved.
//

import UIKit

class CatKindsDetailViewController: UIViewController {
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var Cattext: UITextView!
    
    var  dataDic = Dictionary<String,String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataDic)
        // Do any additional setup after loading the view.
        
        let info = dataDic["detail"]
        let image = dataDic["image"]
        //print(dataDic)
        Cattext.text = info
        headerImage.image = UIImage(named: image!)
        
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
