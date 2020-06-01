//: [Previous](@previous)

import Foundation

print("运算符重载 - 类比C++运算符重载")

struct CenterPointer{
    var x = 0,y = 0
}

func + (left:CenterPointer,right:CenterPointer)->CenterPointer{
    return CenterPointer(x:left.x + right.x,y:left.y+right.y)
}

let pointer1 = CenterPointer(x: 1, y: 1)
let pointer2 = CenterPointer(x: 2, y: 2)
let pointer3 = pointer1 + pointer2

func == (left:CenterPointer, right:CenterPointer) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func != (left:CenterPointer, right:CenterPointer) -> Bool {
    return !(left == right)
}



//: [Next](@next)
