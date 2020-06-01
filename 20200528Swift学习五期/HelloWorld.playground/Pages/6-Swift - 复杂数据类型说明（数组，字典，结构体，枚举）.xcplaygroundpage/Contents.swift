//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//数组
var types = ["none","warning","error"]
var members = [String]()//声明一个空数组
members.append("apple")
members += ["orange"]
members.swapAt(0, 1)
for item in members{
    print(item)
}
//有序号的循环取出
for(index,value) in members.enumerated(){
    print("[\(index)]=\(value)")
}

let items = Array(0..<100).map{"条目\($0)"}
for item in items{
    //print(item)
}
var emptyDic = [String:String]()//建立个空字典
var myDic = ["name":"hangge","url":"hangge.com"]  //声明一个字典
for (key,value) in myDic {
    print("[\(key)]=\(value)")
}

for key in myDic.keys {
    print("key = \(key)")
}

for value in myDic.values {
    print("value = \(value)")
}


//: [Next](@next)
