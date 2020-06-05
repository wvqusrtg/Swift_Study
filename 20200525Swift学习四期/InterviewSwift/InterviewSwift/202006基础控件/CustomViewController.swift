//
//  CustomViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import MBProgressHUD

class CustomViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    let cell_identifier:String = "CustomCell"
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "自定义Cell"
        initView()
    }
    func initView() {
        self.myTableView = UITableView()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
            make.left.right.equalToSuperview()
        }
        self.myTableView.register(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: cell_identifier)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90+10+10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: cell_identifier, for: indexPath)
        return customCell
    }
    
    /// cell点击事件
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //self.navigationController?.pushViewController(Custom2ViewController(), animated: true)
        
//        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
//        hud.label.text = "这是默认带菊花的提示"
//        //背景渐变
//        hud.dimBackground = true
//        //延迟隐藏
//        hud.hide(animated: true, afterDelay: 0.8)
        
        //如下是封装好的
        showTextWithHUD(toView: self.view, textTitle: "indexPath[Section:\(indexPath.section),Row:\(indexPath.row)]", textMsg: nil,afterDelay: 1.0)
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
