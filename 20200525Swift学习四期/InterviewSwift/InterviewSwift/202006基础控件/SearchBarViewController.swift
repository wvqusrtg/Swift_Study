
//
//  SearchBarViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/5.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class SearchBarViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    // 所有组件
    var ctrls:[String] = ["Label","Button1","Button2","Switch","倪新生","倪新伟","露露","珂珂"]
    // 搜索匹配的结果，Table View使用这个数组作为datasource
    var ctrlsel:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift - 搜索条（UISearchBar）的用法"
        initViewData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.ctrlsel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "cell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.ctrlsel[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchBar.resignFirstResponder()
        self.tableView.deselectRow(at: indexPath, animated: true)
        showTextWithHUD(toView: self.view, textTitle: "[section=\(indexPath.section),row=\(indexPath.row)]", textMsg: nil ,afterDelay: 1.0)
    }
    
    //searchbar获取焦点
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    //点击取消按钮
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        self.tableView.reloadData()
    }
    //searchbar文字内容变化
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        //没有搜索内容时显示全部组件
        if searchText == "" {
            self.ctrlsel = self.ctrls
        }else{
            //匹配用户输入内容的前缀（不区分大小写）
            self.ctrlsel = []
            for ctrl in self.ctrls {
                if ctrl.lowercased().hasPrefix(searchText.lowercased()) {
                    self.ctrlsel.append(ctrl)
                }
            }
        }
        //刷新TableView显示
        self.tableView.reloadData()
    }
    // 搜索代理UISearchBarDelegate方法，点击虚拟键盘上的Search按钮时触发
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(true, animated: true)
        self.tableView.reloadData()
    }
    func initViewData() {
        // 起始加载全部内容
        self.ctrlsel = self.ctrls
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin)
            make.bottom.equalTo(self.view.snp_bottomMargin)
            make.left.right.equalTo(self.view)
        }
        self.tableView.tableHeaderView = self.searchBar
        //注册TableViewCell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //懒加载控件
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kMargin*5))
        //searchBar.showsCancelButton = true
        searchBar.delegate = self
        return searchBar
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
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
