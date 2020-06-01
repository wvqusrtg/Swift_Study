//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
class Calculator{
    var a:Int = 1
    var b:Int = 1
    var sum:Int{
        get{
            return a + b
        }
//        set(val){
//            b = val - a
//        }
        set{
            b = newValue - a
        }
    }
}

let cal = Calculator()
print(cal.sum)
cal.sum = 5
print(cal.b)



//: [Next](@next)
