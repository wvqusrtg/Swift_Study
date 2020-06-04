
//
//  ChatDataSource.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

/// 数据提供协议
protocol ChatDataSource {
    
    /// 返回对话记录中的全部行数
    /// - Parameter tableView: tableView description
    func rowsForChatTable(_ tableView: TableView) -> Int
    
    /// 返回某一行的内容
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - dataForRow: dataForRow description
    func chatTableView(_ tableView: TableView,dataForRow:Int) -> MessageItem
}
