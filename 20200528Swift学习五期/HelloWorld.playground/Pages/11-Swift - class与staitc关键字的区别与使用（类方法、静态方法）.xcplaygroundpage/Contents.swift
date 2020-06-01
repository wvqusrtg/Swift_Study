//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//类方法、静态方法
//结构体 struct 和枚举 enum的静态属性，静态方法使用static关键字
struct Account{
    var amount:Double = 0.0
    var owner:String = ""
    
    static var interestRate:Double = 0.668
    
    static func interestBy(amount:Double) -> Double {
        return interestRate * amount
    }
}
//类Class的静态属性，静态方法也可以使用static关键字
class Account2{
    var amount:Double = 0.0
    var owner:String = ""
    
    static var interestRate:Double = 0.668
    
    static func interestBy(amount:Double) -> Double {
        return interestRate * amount
    }
}

Account2.interestBy(amount: 200)

class Account3 {
    var amount : Double = 0.0               // 账户金额
    var owner : String = ""                 // 账户名
  
    class var staticProp : Double {
        return 0.668
    }
 
    class func interestBy(amount : Double) -> Double {
        return 0.8886 * amount
    }
}

//class Account4:Account3{
    //方法可以被重写
//    override class var staticProp: Double{
//
//    }
//    override class func interestBy(amount: Double) -> Double {
//
//    }
//}
   
//访问类计算属性
print(Account3.staticProp)

/**
 三、static 与 class 的区别
 static 可以在类、结构体、或者枚举中使用。而 class 只能在类中使用。
 static 可以修饰存储属性，static 修饰的存储属性称为静态变量(常量)。而 class 不能修饰存储属性。
 static 修饰的计算属性不能被重写。而 class 修饰的可以被重写。
 static 修饰的静态方法不能被重写。而 class 修饰的类方法可以被重写。
 class 修饰的计算属性被重写时，可以使用 static 让其变为静态属性。
 class 修饰的类方法被重写时，可以使用 static 让方法变为静态方法。

 原文出自：www.hangge.com  转载请保留原文链接：https://www.hangge.com/blog/cache/detail_520.html
 */

//: [Next](@next)
