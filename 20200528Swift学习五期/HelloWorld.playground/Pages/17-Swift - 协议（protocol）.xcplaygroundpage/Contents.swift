//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/**
 Swift中的协议类似于别的语言里的接口，协议里只做方法的声明，包括方法名、返回值、参数等信息，
 而没有具体的方法实现
 */
protocol Person{
    //读写属性
    var name:String{get set}
    //只读属性
    var age:Int{get}
    //类型方法
    static func method1()
    //实例方法
    func method2()->Int
    //突变方法
    mutating func method3()
}

//协议可以继承另外一个协议
protocol Animal{
    func move()
}

protocol Bird:Animal{
    func song()
}

class Chiken:Bird{
    func move() {
        print("母鸡走。。。")
    }
    func song() {
        print("母鸡咯咯咯")
    }
}
//如果某个类继承了某个父类，又遵循了某个协议，那么冒号后面应该先写父类，再写协议
//class CC:继承的父类,协议1,协议2{
//
//}

//: [Next](@next)
