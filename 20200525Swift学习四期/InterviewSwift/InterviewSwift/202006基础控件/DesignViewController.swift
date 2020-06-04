//
//  DesignViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class DesignViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "自定义View"
        // Do any additional setup after loading the view.
        self.view.addSubview(self.btnDefine)
        self.btnDefine.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin).offset(kMargin)
            make.leading.equalTo(kMargin)
            make.trailing.equalTo(-kMargin)
            make.height.equalTo(kMargin*5)
        }
        self.btnDefine.addTarget(self, action: #selector(showNIView), for: .touchUpInside)
    }
    @objc func showNIView(){
        let niView = NIView()
        self.view.addSubview(niView)
        niView.snp.makeConstraints { (make) in
            make.top.equalTo(self.btnDefine.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self.btnDefine)
            make.height.equalTo(100)
        }    
    }
    
    lazy var btnDefine: UIButton = {
        let btnDefine = UIButton()
        btnDefine.backgroundColor = .red
        btnDefine.setTitle("弹出自定义View", for: .normal)
        btnDefine.setTitleColor(.white, for: .normal)
        btnDefine.layer.cornerRadius = 5.0
        return btnDefine
    }()
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
