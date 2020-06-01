//: [Previous](@previous)

import Foundation

class Student{
    var name:String = ""
    var number:Int = 0
}

var student = Student()

class Person{
    //属性
    var name:String
    var age:Int
    //类构造
    init(newName:String,newAge:Int) {
        self.name = newName
        self.age = newAge
    }
    //实例方法-成员函数
    func say() -> String {
        "My name is \(name)"
    }
}

var p = Person(newName: "hangge", newAge: 28)
p.say()

//class DBClass{
//    var conn:Connection? = Connection()
//    deinit {
//        //可以做一些清理工作
//        self.conn!.close()
//        self.conn = nil
//    }
//}
//var db:DBClass? = DBClass()
//db = nil //设置nil后即可执行deinit()方法  --- 析构方法






//: [Next](@next)
