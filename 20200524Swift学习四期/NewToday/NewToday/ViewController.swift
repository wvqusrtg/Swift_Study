//
//  ViewController.swift
//  NewToday
//
//  Created by ai-nixs on 2020/5/24.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //测试Common里函数
        self.view.backgroundColor = RGBColor(r: 100, g: 100, b: 100, alpha: 1)
        
        let dic = ["token":"f2e0c88f-7d32-3464-9cc5"]
        
        HttpDatas.shareInstance.requestDatas(.get, URLString: "http://101.132.114.122:8099/message/collect_list", paramaters:dic) { (response) in
            let jsonData = JSON(response)
            print("jsonData=\(jsonData)")
        }
    }


}

