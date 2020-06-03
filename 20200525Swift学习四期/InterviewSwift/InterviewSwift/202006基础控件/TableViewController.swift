//
//  TableViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/3.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class TableViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var ctrlNames:[String]?
    var tableView:UITableView?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initView()
    }
    
    func initView() {
        self.tableView = self.tableView_lazy
        self.view.addSubview(self.tableView!)
        self.tableView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view.snp_topMargin).offset(0)
            make.bottom.equalTo(self.view.snp_bottomMargin)
            make.left.right.equalTo(self.view)
        })
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlNames!.count
    }
    //创建各单元格显示内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //为了提供表格显示性能，已创建完成的丹玉需重复使用
        let identifity:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已c注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identifity, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.ctrlNames![indexPath.row]
        return cell
    }
    //表格cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        showTextWithHUD(toView: self.view, textTitle: nil, textMsg: self.ctrlNames![indexPath.row], afterDelay: 1.0)
    }
    //滑动删除必须实现的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        showTextWithHUD(toView: self.view, textTitle: nil, textMsg: "删除\(indexPath.row)", afterDelay: 1.0)
        let index = indexPath.row
        self.ctrlNames?.remove(at: index)
        self.tableView?.deleteRows(at: [indexPath], with: .left)
    }
    //滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    //修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删-×"
    }
        
    func initData() {
        self.ctrlNames = [String]()
        self.ctrlNames!.append("标签UIlabel")
        self.ctrlNames!.append("文本框UITextField")
        self.ctrlNames!.append("按钮UIButton")
        self.ctrlNames!.append("开关按钮UISwitch")
        self.ctrlNames!.append("分段控制器UISegmentControl")
        self.ctrlNames!.append("图像UIImageView")
        self.ctrlNames!.append("进度条UIProgressView")
        self.ctrlNames!.append("滑动条UISlider")
    }
    lazy var tableView_lazy: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        //创建一个k重用单元格
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        tableView.tableHeaderView = self.headView
        return tableView
    }()
    lazy var headView: UIView = {
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kMargin*10))
        headView.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.3)
        let labTitle = UILabel()
        labTitle.text = "UITablView HeadView"
        labTitle.textColor = .red
        headView.addSubview(labTitle)
        labTitle.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        return headView
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
