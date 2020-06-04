//
//  ViewController.swift
//  hangge_559
//
//  Created by hangge on 2017/4/5.
//  Copyright © 2017年 hangge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ChatDataSource {
    
    var Chats:Array<MessageItem>!
    var tableView:TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChatTable()
    }
    
    /*创建表格及数据*/
    func setupChatTable() {
        self.tableView = TableView(frame:self.view.bounds, style: .plain)
        
        //创建一个重用的单元格
        self.tableView!.register(TableViewCell.self, forCellReuseIdentifier: "MsgCell")
        
        let me = "xiaoming.png"
        let you = "xiaohua.png"
        
        let first =  MessageItem(body:"你看这风景怎么样，我周末去苏州拍的！", logo:me,
                                 date:Date(timeIntervalSinceNow:-600), mtype:.mine)
        
        let second =  MessageItem(image:UIImage(named:"sz.png")!,logo:me,
                                  date:Date(timeIntervalSinceNow:-290), mtype:.mine)
        
        let third =  MessageItem(body:"太赞了，我也想去那看看呢！",logo:you,
                                 date:Date(timeIntervalSinceNow:-60), mtype:.someone)
        
        let fouth =  MessageItem(body:"嗯，下次我带你去吧！",logo:me,
                                 date:Date(timeIntervalSinceNow:-20), mtype:.mine)
        
        let fifth =  MessageItem(body:"三年了，我终究没能看到这个风景",logo:you,
                                 date:Date(timeIntervalSinceNow:0), mtype:.someone)
        
        Chats = [first,second, third, fouth, fifth]
        
        self.tableView.chatDataSource = self
        self.tableView.reloadData()
        self.view.addSubview(self.tableView)
    }
    
    /*返回对话记录中的全部行数*/
    func rowsForChatTable(_ tableView:TableView) -> Int {
        return self.Chats.count
    }
    
    /*返回某一行的内容*/
    func chatTableView(_ tableView:TableView, dataForRow row:Int) -> MessageItem {
        return Chats[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


