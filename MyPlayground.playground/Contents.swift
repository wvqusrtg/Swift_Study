
import UIKit

var str = "Hello, playground by:nixs Nice"
print(str)

var welcomeMessage: String = "Nice to meet you."
welcomeMessage = "倪新生"
print(welcomeMessage)

let π=3.14
let 🐂="cow"
var friendlyWelcome = "hello"
friendlyWelcome="加菲猫"
print(friendlyWelcome)
print("字符串拼接 \(welcomeMessage) \(π) \(🐂)")

let cat:String="little cat";print(cat)

let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型
print("minValue:\(minValue) ; maxValue:\(maxValue)")

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi 等于 3.14159，所以被推测为 Double 类型
print(pi)

typealias AudioSample = UInt16
print(AudioSample.max)

let http404Error = (404,"Not Found")
let (statusCode,statusMsg) = http404Error

print("The status code is \(statusCode)")
print("The status code is \(statusMsg)")

//let rgbColor = (r:(223/255),g:(124/255),b:(25/255))
let rgbColor = (r:5,g:8.90,b:3.14)
print("The color r is \(rgbColor.r)")
print("The color g is \(rgbColor.g)")
print("The color b is \(rgbColor.b)")

let stu = (name:"nixs",sex:"male",age:28)
print("name of stu is \(stu.name)")
print("name of sex is \(stu.sex)")
print("name of age is \(stu.age)")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// 输出“convertedNumber contains some integer value.”
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出“convertedNumber has an integer value of 123.”

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
// 输出“'123' has an integer value of 123”

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出“4 < 42 < 100”

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出“4 < 42 < 100”

func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}

let age = -3
assert(age <= 0, "A person's age cannot be less than zero")
//assert(age >= 0, "A person's age cannot be less than zero")
// 因为 age < 0，所以断言会触发

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    //assertionFailure("A person's age can't be less than zero.")
}

let (x, y) = (1, 2)
// 现在 x 等于 1，y 等于 2
if let x:Int = y{
    print("y的值 \(y)赋值给x \(x)")
}
print("x=\(x)")

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"
print(colorNameToUse)
