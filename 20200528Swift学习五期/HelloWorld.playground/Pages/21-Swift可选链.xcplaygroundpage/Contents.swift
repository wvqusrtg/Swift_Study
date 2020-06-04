//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
class Person{
    var residence:String?
    
}
let john = Person()
//john.residence = "NIXS"
//let roomCount = john.residence!.count
//print(roomCount)
if let rootCont = john.residence?.count {
    print("john's residence count:\(rootCont)")
}else{
    print("Unable to retrieve the number of rooms.")
}
//深入理解 Swift 可选链 （国外优秀教程精译）https://www.jianshu.com/p/10b95e01936d
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album0 = albumReleased(year: 2009)
//注意如下强制解包是比较危险的，除非你确定有值，要不强制解包会引起程序崩溃
print("The album is \(String(describing: album0))")
//print("The album is \(album0!)")//强制解包
print("The album is \(album0 ?? "")")//不要强制解包，如果为nil会崩溃的

let album = albumReleased(year: 2006) ?? "not found"
print("The album is \(album)")

//https://www.jianshu.com/p/dc713e0b0cb3
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}
var status: String?
status = getHaterStatus(weather: "sunny") ?? "default"

if let unwrappedStatus = status {
    // unwrappedStatus 是非可选值
} else {
    // 解包失败的处理
}

//https://www.jianshu.com/p/a1ab8dc14dff
var items = ["James", "John", "Sally"]
func position(of string:String,in array:[String])->Int{
    for i in 0..<array.count{
        if array[i]==string {
            return i
        }
    }
    return 0
}
let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)



//: [Next](@next)
