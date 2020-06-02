//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//1.as使用场合
//（1）从派生类转换为基类，向上转型（upcasts）
class Animal{}
class Cat: Animal {}
let cat = Cat()
class Dog: Animal{}
let animal = cat as Animal

// (2) 消除二义性，数值类型转换
let num1 = 42 as Float
let num2 = 42 as Int
let num3 = 42.5 as Float
let num4 = (42/2) as Double
print(num1,num2,num3,num4)

// (3) switch语句中进行模式匹配
//如果不知道一个对象是什么类型，你可以通过switch语法监测它的类型，并且尝试在不同的情况下使用对应的类型进行相应的处理
switch animal {
case let cat as Cat:
    print("如果是Cat类型对象，则做相应处理")
case let dog as Dog:
    print("如果是Dog类型对象，则做相应处理")
default:
    print("default")
}

//2.as!使用场合
//向下转型（Downcasting）时使用。由于是强制类型转换，如果转换失败会报runtime运行错误。
let animal2:Animal = Cat()

let cat2 = animal2 as! Cat

//3.as?使用场合
//as?和as!操作符的转换规则完全一样。但是as?如果转换不成功的时候便会返回一个nil对象。成功的话返回可选类型值（optional），需要我们拆包使用。
//由于as?在转换失败的时候也不会出现错误，所以对于如果能确保100%会成功的转换则可使用as!,否则使用as?
if let cat3 = animal2 as? Cat{
    print("cat is not nil")
}else{
    print("cat is nil")
}


//: [Next](@next)
