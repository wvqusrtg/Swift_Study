//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class People{
    //属性
    var firstName:String = ""
    var lastName:String = ""
    var nickName:String = ""
    
    //计算属性
    var fullName:String{
        get{
            return nickName + " " + firstName + " " + lastName
        }
    }
    //带属性监视器的普通属性
    var age:Int = 0{
        willSet{
            print("Will set an new value \(newValue) to age")
        }
        didSet{
            print("age filed changed form \(oldValue) to \(age)")
            if age<10
            {
                nickName = "Little"
            }else
            {
                nickName = "Big"
            }
        }
    }
    
    func toString() ->String{
        return "Full Name: \(fullName) " + ", Age: \(age) "
    }
}

let me = People()
me.firstName = "Li"
me.lastName = "Lei"
me.age = 10
print(me.toString())



//: [Next](@next)
