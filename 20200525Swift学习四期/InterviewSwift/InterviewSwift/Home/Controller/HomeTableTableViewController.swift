//
//  HomeTableTableViewController.swift
//  InterviewSwift
//
//  Created by ai-nixs on 2020/5/7.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class HomeTableTableViewController: UITableViewController {
    
    var data = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Swift学习"
        data.append(["1.SnapKit框架解析（一） —— SnapKit应用的一个简单示例（一）","https://www.jianshu.com/p/daa3496c9736"])
        data.append(["2.吃喝实验室","​​每当夏季来临，烧烤作为大排挡的必选美食，用它那独有的芬芳占据着每一个吃货的味蕾，让辛苦一天的人儿能够在美食当中，放飞自我。"])
        data.append(["3.姚晨","上个月回了趟家，担任了“福建省旅游形象大使”。从今往后，将持续为家乡美景美食打call。跟姐来，带你坐上“全福游”，好吃好玩没理由！"])
        data.append(["4.天天美食推荐","吃了几十年蒸水蛋，原来这才是最正确的做法，孩子抢着吃！"])
        // 关键代码，设置行高自动适配
        tableView.rowHeight = UITableView.automaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    /// 表格显示
    /// - Parameters:
    ///   - tableView: 表格
    ///   - indexPath: indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = MomentTableViewCell.dequeueReusable(with: tableView)
        // Configure the cell...
        let item = data[indexPath.row]
        cell.usernameLabel.text = item[0]
        cell.contentLabel.text = item[1]
        return cell
    }
    
    /// 表格的点击事件
    /// - Parameters:
    ///   - tableView: 表格
    ///   - indexPath: indexPath
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cell反选
        tableView.deselectRow(at: indexPath, animated: true)
        //打印点击行
        //print("---Section:\(indexPath.section) ---row:\(indexPath.row)")
        //控制器跳转
        pushVC(indexpath: indexPath)
    }
    
    /// 控制器跳转
    /// - Parameter indexpath: 表格 section/row
    private func pushVC(indexpath:IndexPath) {
        self.navigationController?.hidesBottomBarWhenPushed = true
        var tarVC : UIViewController?
        switch indexpath.row {
        case 0:
            tarVC = SnapkitController()
        default:
            tarVC = HomeViewController()
        }
        tarVC?.navigationItem.title = data[indexpath.row][0]
        self.navigationController?.pushViewController(tarVC ?? HomeViewController(), animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
