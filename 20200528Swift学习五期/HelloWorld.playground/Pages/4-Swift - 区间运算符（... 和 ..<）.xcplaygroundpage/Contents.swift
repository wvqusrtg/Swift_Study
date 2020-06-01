//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
let index = str.index(str.startIndex, offsetBy: 5)
let slice = str[str.startIndex..<str.index(str.startIndex, offsetBy: 5)]
//let withPartialRange0 = str[0..<str.index(str.startIndex, offsetBy: 5)]//如此会报错的！！！
let withPartialRange1 = str[..<str.index(str.startIndex, offsetBy: 5)]
let slice2 = str.prefix(5)





//: [Next](@next)
