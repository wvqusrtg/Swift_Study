//
//  Point.swift
//  ConsoleLearn
//
//  Created by nixs on 2020/5/14.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

struct Point {
    var x = 0.0,y = 0.0
    
    func isToTheRightOf(x:Double) -> Bool {
        return self.x>x
    }
    
    mutating func moveBy(x deltaX:Double,y deltaY:Double) {
        x+=deltaX
        y+=deltaY
    }
    
    mutating func moveBy2(x deltaX:Double,y deltaY:Double) {
        self = Point(x: x+deltaX, y: y+deltaY)
    }
}

//三态开关
enum TriStateSwitch {
    case off,low,heiht
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .heiht
        case .heiht:
            self = .off
        }
    }
}
