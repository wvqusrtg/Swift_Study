//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func sum(v1:Int,V2:Int)->Int{
    return v1+V2
}

func sum2(v1:Int,V2:Int)->Int{
    v1+V2
}

func goToWork(at time:String){
    print("this time is \(time)")
}

goToWork(at: "08:00")

func sum3(_ v1:Int,_ v2:Int)->Int{
    return v1 + v2
}
sum(v1: 2, V2: 8)
sum2(v1: 3, V2: 9)
sum3(3, 4)

//参数可以有默认值
//(类比和C++默认参数区别) C++的默认参数值有个限制：必须从右往左设置，由于Swift有参数标签，因此并没有此类限制
func check(name:String = "nobody",age:Int,job:String = "none"){
    print("name = \(name),age = \(age),job = \(job)")
}
check(name: "Jack", age: 20, job: "Doctor")
check(name: "Rose", age: 18)
check(age: 30, job: "Batman")
check(age: 40)
//可变参数
func sum(_ numbers:Int...)->Int{
    var total:Int = 0
    for number in numbers{
        total+=number
    }
    return total
}
sum(1,2,3,4,5)
//参数string不能省略标签
func test(_ numbers:Int...,string:String,_ other:String){
    print("")
}
test(10,23,45, string: "nixs", "韩露")

print("nixs","hanlu","nixw","keke")
print("倪新生","韩露", separator: "-", terminator: "\n")

//输入、输出参数
var num = 10
func changeNum(_ num: inout Int){
    num = 20
}
changeNum(&num)
print(num)




//: [Next](@next)
