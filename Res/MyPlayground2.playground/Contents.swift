import UIKit

let quotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."

"牛叉叉" 是不？who are you ?
"""
//print(quotation)
let str = "Dog!🐶子"
for character in str{
    //print(character)
}
//print("长度count=\(str.count)")

let catCharacter:[Character] = ["c","a","t"];
let catString = String(catCharacter)
//print(catString)

let str1 = "Hello"
let str2 = " There"
//print(str1+str2)
//var instruction = str1+str2
var instruction="look overthere"
instruction+=str2
instruction.append(" 倪新生")
//print(instruction)

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"
//print(message)

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// 打印输出“unusualMenagerie has 40 characters”

let greeting = "Guten Tag!"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]

greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
//print(greeting[index])

for index in greeting.indices{
    print("\(greeting[index])",terminator: "")
}

var welcome = "hello"
welcome.insert("#", at: welcome.endIndex)
welcome.insert(contentsOf:" 倪新生", at: welcome.index(before: welcome.endIndex))
//welcome.insert(contentsOf:" 倪新生", at: welcome.index(after: welcome.startIndex))
// welcome 变量现在等于 "hello there!"

