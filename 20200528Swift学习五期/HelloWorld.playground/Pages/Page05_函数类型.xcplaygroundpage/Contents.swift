//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func sum(v1:Int,v2:Int)->Int{
    v1+v2
}

func difference(v1:Int,v2:Int)->Int{
    v1-v2
}

//定义变量（函数赋值给一个变量）
var fn:(Int,Int)->Int = sum
//变量传参直接调用函数-调用时候不用加标签
var result = fn(2,4)
print("result = \(result)")

func printResult(_ mathFn:(Int,Int)->Int,_ a:Int, _ b:Int){
    print("Result = \(mathFn(a,b))")
}

printResult(sum,1,2)
printResult(difference,2,1)

func next(_ input:Int)->Int{
    input + 1
}
func previous(_ input:Int)->Int{
    input - 1
}
func forward(_ forward:Bool)->(Int)->Int{
    forward ? next : previous
}

var result01 = forward(true)(3)//true +1
var result02 = forward(false)(4)//false -1
print(result01,result02)

//别名
typealias Byte = Int8
typealias Short = Int16
typealias Long = Int64

typealias Date = (year:Int,month:Int,day:Int)
func testDate(_ date:Date){
    print("year:\(date.0)")
    print("month:\(date.month)")
    print("day:\(date.day)")
}

testDate((2020,05,30))

typealias IntFn = (Int,Int)->Int

let fnTest:IntFn = difference
let fnResult = fnTest(3,1)

func setFnTest(_ fnTest:IntFn){
    
}

setFnTest(sum)
setFnTest(difference)

func test001()->Void{
    
}

//: [Next](@next)
