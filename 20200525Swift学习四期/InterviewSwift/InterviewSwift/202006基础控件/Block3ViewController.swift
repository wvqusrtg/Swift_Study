//
//  Block3ViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/9.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

/// 在OC中习惯用block来传值，而在swift中,block被重新定义了一下，叫闭包；
/// 使用技巧：谁定义谁传值
class Block3ViewController: BaseViewController {
    //返回数据回调
    public var backLocationString:((String,String,String,String)->())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ThridViewController"
        
        let btn = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100));
        btn.backgroundColor = UIColor.red;
        self.view.addSubview(btn)
        btn.addTarget(self, action:#selector(popclick), for: UIControl.Event.touchUpInside)
        

    }
    @objc func popclick() {
        if backLocationString != nil {
            backLocationString("乔治大街15号","纽约市","本杰明","龙港")
        }
    }
}
