//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//[8.Swift - 自定义函数规则说明](https://www.hangge.com/blog/cache/detail_517.html)

//返回由多个值组成的符合返回值
func test(name:String)->(Int,Bool){
    let position = 1
    let visible = false
    return (position,visible)
}
//可变形参：可以接受0个或者任意数量的输入参数
func test2(numbers:Int...)->Int{
    var total:Int = 0
    for number in numbers{
        total += number
    }
    return total
}
test2(numbers: 1,2,3,4,5)


func add(age:inout Int){
    age += 1
}

var age = 22
add(age: &age)
print(age)

func additive(a:Int, b:Int) -> Int{
    return a + b
}

func printAdditiveResult(addFun:(Int,Int)->Int,a:Int,b:Int){
    print("Result:\(addFun(a,b))")
}

printAdditiveResult(addFun: additive(a:b:), a: 2, b: 3)

//定义个自增函数
func increase(input:Int) -> Int{
    return input + 1
}
 
//定义个自减函数
func reduce(input:Int) -> Int{
    return input - 1
}

func chooseFunction(backwards:Bool)->(Int)->Int{
    return backwards ? increase(input:):reduce(input:)
}

let aFun = chooseFunction(backwards: 3>2)
print(aFun(3))

//: [Next](@next)
