//
//  BlockViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/9.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class BlockViewController: BaseViewController,btnClickDelegate,UITableViewDelegate,UITableViewDataSource {
    let identify:String = "JRLoginTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift delegate 和 block 使用"
        initView()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        216
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        //let identify:String = "JRLoginTableViewCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)as! JRLoginTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        
        cell.blockproerty = {(backMsg,no) in
            print("block回调值：\(backMsg) no=\(no)")
        }
        return cell
    }
    
    /// cell点击事件
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        showTextWithHUD(toView: self.view, textTitle: "[section=\(indexPath.section),row=\(indexPath.row)]", textMsg: nil ,afterDelay: 1.0)
        block_LEAEN_MORE()
    }
    
    /// 实现协议方法
    /// - Parameter tag: tag description
    func btnClickMethod(tag: Int, andContent: String) {
        print(tag)
        if tag == 1 {
            //获取验证码
            print("代理实现-获取验证码 - 代理传来值[\(andContent)]")
        }else if tag == 2{
            //登录
            print("登陆-代理实现-登陆 - 代理传来值[\(andContent)]")
        }
    }
    
    /// block进阶学习
    func block_LEAEN_MORE() {
        let vc = Block3ViewController()
        vc.backLocationString = {(address,province,city,area) in
            print("[address=\(address)],[province=\(province)],[city=\(city)],[area=\(area)]")
            self.navigationItem.title = "[address=\(address)],[province=\(province)],[city=\(city)],[area=\(area)]"
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
    func initView() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
            make.left.right.equalTo(self.view)
        }
        //注册TableViewCell
        //self.tableView.register(JRLoginTableViewCell.self, forCellReuseIdentifier: identify)
        let nib = UINib(nibName: "JRLoginTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        self.tableView.register(nib, forCellReuseIdentifier: identify)
    }
    
    //懒加载控件
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
}
