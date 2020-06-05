//
//  TableGroupViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/3.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class TableGroupViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate {
    var tableView:UITableView?
    var allnames:Dictionary<Int,[String]>?
    var adHeaders:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initView()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allnames!.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allnames![section]!.count
    }
    // *** UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
        -> String? {
        return self.adHeaders?[section]
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50.0
        }else{
            return 100.0
        }
    }
    //如果写如下，则上面不起作用(Footer同理)
    #warning("如果写如下，则上面(titleForHeaderInSection)不起作用(Footer同理)")
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 50.0))
        viewForHeaderView.backgroundColor = .purple
        let labtitle = UILabel()
        labtitle.text = self.adHeaders?[section]
        labtitle.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.5)
        labtitle.textColor = .red
        viewForHeaderView.addSubview(labtitle)
        labtitle.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(40.0)
        }
        return viewForHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 40.0
        }else{
            return 40.0
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewForFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 50.0))
        viewForFooterView.backgroundColor = RGBColor(r: 300, g: 100, b: 50, alp: 0.5)
        let labtitle = UILabel()
        let data = self.allnames?[section]
        labtitle.text = "viewForFooterInSection Foo有\(data!.count)个控件"
        if section == 0 {
            labtitle.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.5)
        }else{
            labtitle.backgroundColor = RGBColor(r: 100, g: 100, b: 100, alp: 0.5)
        }
        labtitle.textColor = .red
        viewForFooterView.addSubview(labtitle)
        labtitle.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(40.0)
        }
        return viewForFooterView
    }
    
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的尾部
    func tableView(_ tableView:UITableView, titleForFooterInSection section:Int)->String? {
        let data = self.allnames?[section]
        return "有\(data!.count)个控件"
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
//            //同一形式的单元格重复使用，在声明时已注册
//            let cell = tableView.dequeueReusableCell(
//                withIdentifier: identify, for: indexPath)
//            cell.accessoryType = .disclosureIndicator
//
//            let secno = indexPath.section
//            let data = self.allnames?[secno]
//            cell.textLabel?.text = data![indexPath.row]
//
//            return cell
            
            //同一形式的单元格重复使用，在声明时已注册
            let secno = indexPath.section
            let data = self.allnames?[secno]
            if(secno == 0)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                        for: indexPath as IndexPath) as UITableViewCell
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                 
                let image = UIImage(named:"coder")
                cell.imageView?.image = image
                cell.textLabel?.text = data![indexPath.row]
                 
                return cell
            }
            else
            {
                //第二个分组表格使用详细标签
                let adcell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                             reuseIdentifier: "SwiftCell")
                adcell.textLabel?.text = data![indexPath.row]
                print(adcell.textLabel!.text ?? "")
                adcell.detailTextLabel!.text = "这是\(data![indexPath.row])的说明"
                 
                return adcell;
            }
    }
     
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        self.tableView!.deselectRow(at: indexPath, animated: true)
        
        let itemString = self.allnames![indexPath.section]![indexPath.row]
        let alertController = UIAlertController(title: "提示!",
                                                message: "你选中了【\(itemString)】",
            preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func initView() {
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
         
        //创建表头标签
        let headerLabel = UILabel(frame: CGRect(x:0, y:0,
                                        width:self.view.bounds.size.width, height:100))
        headerLabel.backgroundColor = UIColor.black
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.textAlignment = .center
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.text = "高级 UIKit 控件 - HeadView"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        //头部视图、尾部视图的高度由自定义View控制大小
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 100))
        headView.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.3)
        headView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        self.tableView!.tableHeaderView = headView
        
        //创建表头标签
        let footerLabel = UILabel(frame: CGRect(x:0, y:0,
                                        width:self.view.bounds.size.width, height:100))
        footerLabel.backgroundColor = UIColor.black
        footerLabel.textColor = UIColor.white
        footerLabel.numberOfLines = 0
        footerLabel.textAlignment = .center
        footerLabel.lineBreakMode = .byWordWrapping
        footerLabel.text = "高级 UIKit 控件 - FooterView"
        footerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 100))
        footerView.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.3)
        footerView.addSubview(footerLabel)
        footerLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        self.tableView!.tableFooterView = footerView
        
        //绑定对长按的响应
        let longPress = UILongPressGestureRecognizer(target:self,
                          action:#selector(tableviewCellLongPressed(_:)))
        //代理
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        self.tableView!.addGestureRecognizer(longPress)
    }
    //单元格长按事件响应
    @objc func tableviewCellLongPressed(_ gestureRecognizer:UILongPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizer.State.began)
        {
            print("UIGestureRecognizerStateBegan");
        }
        if (gestureRecognizer.state == UIGestureRecognizer.State.changed)
        {
            print("UIGestureRecognizerStateChanged");
        }
         
        if (gestureRecognizer.state == UIGestureRecognizer.State.ended)
        {
            print("UIGestureRecognizerStateEnded");
            //在正常状态和编辑状态之间切换
            if(self.tableView!.isEditing == false)
            {
                showTextWithHUD(toView: self.view, textTitle: "进入编辑状态", textMsg: nil, afterDelay: 1.0)
                self.tableView!.setEditing(true, animated:true)
            }
            else
            {
                showTextWithHUD(toView: self.view, textTitle: "关闭进入编辑状态", textMsg: nil, afterDelay: 1.0)
                self.tableView!.setEditing(false, animated:true)
            }
        }
    }
    //设置单元格的编辑的样式
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath)
        -> UITableViewCell.EditingStyle {
            if(self.tableView!.isEditing == false)
            {
                return UITableViewCell.EditingStyle.delete
            }
            else
            {
                return UITableViewCell.EditingStyle.insert
            }
    }
     
    //设置确认删除按钮的文字
    func tableView(_ tableView: UITableView,
                   titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            var data = self.allnames?[indexPath.section]!
             
            let itemString = data![indexPath.row] as String
            return "确定删除\(itemString)？"
    }
     
    //单元格编辑后（删除或插入）的响应方法
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete)
        {
            self.allnames?[indexPath.section]?.remove(at: indexPath.row)
            self.tableView!.reloadData()
            print("你确认了删除按钮")
        }
        else if(editingStyle == UITableViewCell.EditingStyle.insert)
        {
            self.allnames?[indexPath.section]?.insert("插入一项新的",
                                                      at: indexPath.row+1)
            print("你按下了插入按钮")
            self.tableView!.reloadData()
        }
    }
    func initData() {
        //初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames =  [
            0:[String]([
                "UILabel 标签",
                "UITextField 文本框",
                "UITextView 文本域",
                "UIButton 按钮"]),
            1:[String]([
                "UIDatePiker 日期选择器",
                "UIToolbar 工具条",
                "UITableView 表格视图"])
        ];
         
        print("字典：\(self.allnames! as Any)")
        
        self.adHeaders = [
            "【viewForHeaderInSection】常见 UIKit 控件-normal",
            "【viewForHeaderInSection】高级 UIKit 控件-height level"
        ]
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
