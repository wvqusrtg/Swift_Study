//
//  main.swift
//  ConsoleLearn
//
//  Created by ai-nixs on 2020/5/12.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

print("---方法---")
let descLab = """
方法
    类、结构体、枚举-都可以定义实例方法/定义类型方法
实例方法
    
"""
print(descLab)


let counter = Counter()
// 初始计数值是0
print(counter.count)
counter.increment()
// 计数值现在是1
print(counter.count)
counter.increment(by: 5)
// 计数值现在是6
print(counter.count)
counter.reset()
// 计数值现在是0
print(counter.count)

