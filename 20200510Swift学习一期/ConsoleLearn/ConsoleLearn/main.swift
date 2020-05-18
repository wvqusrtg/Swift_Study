//
//  main.swift
//  ConsoleLearn
//
//  Created by ai-nixs on 2020/5/12.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

print("---析构过程---")
let descLab = """
析构过程
    析构器只适用于类类型，当一个类的实例被释放之前，析构器会被立即调用。
析构器用关键字deinit来标示，类似于构造函数要用init来标示。

协议
    协议定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西。
类、结构体或枚举都可以遵守协议，并为协议定义的这些要求提供具体实现。某个类型能够满足某个协议的要求，
就可以说该类型遵守这个协议
"""
print(descLab)
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// 打印“A new player has joined the game with 100 coins”
print("There are now \(Bank.coinsInBank) coins left in the bank")
// 打印“There are now 9900 coins left in the bank”
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// 打印“PlayerOne won 2000 coins & now has 2100 coins”
print("The bank now only has \(Bank.coinsInBank) coins left")
// 打印“The bank now only has 7900 coins left”

// *** Object-c项目调用Swift项目及方法？？？

//func canThrowErrors() throws -> String
//func cannotThrowErrors() -> String

//类型转换
//嵌套类型
//拓展
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印“One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印“Three feet is 0.914399970739201 meters”

extension Int{
    func repetitions(task:()->Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello World!")
}

extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt)
//协议

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)

//class SomeClass: SomeProtocol {
//    required init(someParameter:Int) {
//        //这里是构造器的实现部分
//    }
//}

protocol InheritingProtocol: SomeProtocol,AnotherProtocol {
    //这里是协议的定义部分
}

//泛型
func swapTowValues<T>(_ a: inout T,_ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func someFunction<T: SomeClass,U: SomeProtocol>(someT: T, someU: U)  {
    //这里是泛型函数的函数体部分
}
//不透明类型
//内存安全
//访问控制
/**
 open和public
 internal
 fileprivate
 private
 
 */

