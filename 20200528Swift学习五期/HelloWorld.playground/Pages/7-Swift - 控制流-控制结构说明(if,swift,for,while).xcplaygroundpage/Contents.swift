//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
var height = 1.72
switch height {
case 1...3 where height == 1.72:
    print("case 1")
case 1...3 where height == 2:
    print("case 2")
default:
    print("default")
}

for i in 0..<10{
    print(i)
}

//: [Next](@next)
