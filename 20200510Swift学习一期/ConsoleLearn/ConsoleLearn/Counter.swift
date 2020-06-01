//
//  Counter.swift
//  ConsoleLearn
//
//  Created by nixs on 2020/5/14.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation
class Counter {
    var count = 0
    func increment() {
        //count+=1
        self.count+=1
    }
    func increment(by amount:Int) {
        count+=amount
    }
    func reset() {
        count = 0
    }
}
