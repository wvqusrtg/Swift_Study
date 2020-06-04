//
//  Custom2ViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class Custom2ViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource{
    var mainTable: UITableView?
    var mainArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "菜谱-这是个坑的代码-借鉴吧"
        // Do any additional setup after loading the view.
        self.setUpTable()
        self.loadDataSource()
    }
    // MARK: - tableView Delegate && tableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(mainArray!.count)
        return mainArray!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "mainCell"
        let cell = MenuTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        //下面两个属性对应subtitle
        //        cell.firstTitle?.text = mainArray![indexPath.row] as? String
        //        cell.subTitle?.text = mainArray![indexPath.row] as? String
                
        var dic = Dictionary<String, String>()
        dic["name"] = mainArray![indexPath.row] as? String
        cell.setValueForCell(dic: dic as NSDictionary)
                
        //添加照片
        //        cell.showImage?.image = UIImage(named: mainArray![indexPath.row] as! String)
                
        return cell
    }
    func loadDataSource() {
        mainArray = NSMutableArray.init(array: ["宝宝0", "宝宝1", "宝宝2", "宝宝3", "宝宝4", "宝宝5", "宝宝6", "宝宝7", "宝宝8", "宝宝9", "宝宝10", "宝宝11"])

        self.mainTable?.reloadData()
    }
    
    func setUpTable(){
        mainTable = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH) , style: UITableView.Style.grouped)
        mainTable!.delegate = self
        mainTable!.dataSource = self
        mainTable!.backgroundColor = UIColor.white
        self.view.addSubview(mainTable!)
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
