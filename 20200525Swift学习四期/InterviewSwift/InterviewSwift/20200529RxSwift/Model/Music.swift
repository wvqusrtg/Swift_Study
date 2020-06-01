
//
//  Music.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/29.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

struct Music {
    let name:String //歌名
    let singer:String //演唱者
    init(name:String,singer:String) {
        self.name = name
        self.singer = singer
    }
}
//实现CustomStringConvertible协议，方便输出调试
extension Music:CustomStringConvertible{
    var description: String{
        return "name \(name) singer: \(singer)"
    }
    
}
