//
//  main.swift
//  SwiftBasicReview
//
//  Created by nixs on 2020/5/15.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

print("1.声明常量和变量")
//常量
let double:Double = 2.0
//推断为一个Double类型
let inferredDouble = 2.0
//变量
var mutableInt:Int = 1
//可以给一个变量重新赋值
mutableInt = 2

print("2.数值类型转换")
let integerValue = 8
let doubleVale = 8.0
//类型转换
let sum = Double(integerValue)+doubleVale

print("3.字符串")
let helloWorld = "Hello,World!"
//多行字符串字面量来跨越多行
let helloWorldProgram = """
    A "Hello,World!" program generally is a computer program
that outputs or displays the message "Hello,World!"
"""
//print(helloWorldProgram)
//空字符串
let emptyString = ""
//初始化
let anotherEmptyString = String()
//修改字符串
var mutableString = "Swift"
mutableString += " is awesome!"
//print(mutableString)
//字符串插值
//print("the value is \(double)")
//print("This is my option:\(mutableString)")

print("4.元组")
let httpError = (503,"Server Error")
//分解元组内容
let (code,reson) = httpError
//另一种分解方式
let codeByIndex = httpError.0
let reasonByIndex = httpError.1
//使用_忽略元组的某些部分
let (_,justTheReason) = httpError

print("5.可选项")
//catchphrase可以包含String或nil
var catchphrase:String?//由编译器自动设置为nil
// ?? 如果catchphrase为nil 就显示 default value
//catchphrase = catchphrase ?? "nixs"
//print(catchphrase ?? "default value")
catchphrase = "Hey,What‘s up,everybody?"
//print(catchphrase ?? "default value")
//强制解包操作符(!)
let count1:Int = catchphrase!.count
//print(count1)
//可选绑定
if let count = catchphrase?.count {
    //print(count)
}
//合并操作符(??)
let count2:Int = catchphrase?.count ?? 0
//链式操作符(?)
let count3:Int? = catchphrase?.count
//print(count3 ?? 0)
//隐式展开可选值
let forcedCatchphrase:String!="Hey,What's up,EVERYBODY?"
let implicitCatchphrase = forcedCatchphrase//无需使用感叹号
//集合类型：Array
print("6.集合类型：Array")
let immutableArray:[String] = ["Alice","Bob","nixs","hanlu","nixw","keke"]
//mutableArray的类型为[String]
var mutableArray = ["Eve","Frank"]
var number = 0
for item in immutableArray{
    //print("[\(String(number))] - "+item)
    //number+=1
}
//测试包含关系
let isEveThere = immutableArray.contains("Eve")
//print(isEveThere)
let name:String = immutableArray[0]//通过索引访问
//print(name)
//在列表中修改项目
mutableArray[1] = "倪新生"
mutableArray.append("韩露")
mutableArray.insert("珂珂", at: 0)
mutableArray.removeLast()
for item in mutableArray{
    //print("[\(String(number))] - "+item)
    //number+=1
}
print("7.集合类型：Dictionary")
let immutableDict:[String:String] = ["name":"Kirk","rank":"captain","sex":"male"]
var mutableDict = ["name":"Picard","rank":"captain","sex":"famale"]
//通过key来访问，如果不存在对应key则返回nil
let name2:String? = immutableDict["names"]
//print(name2)
//print(name2 ?? "key不存在")
//更新key对应的value
mutableDict["name"]="倪新生"
//添加新的key-value
mutableDict["school"]="倪庄小学"
//通过key来删除某项，如果key不存在，则返回nil
let rankWasRemoved:String? = mutableDict.removeValue(forKey: "schools")
//print(rankWasRemoved ?? "值不存在")
for (key,value) in mutableDict{
    //print("key:[\(key)],value:[\(value)]")
}
print("8.集合类型：Set")
//Set会忽略重复项，所以immutableSet只有2项：“chocolate”和“vanilla”
let immutableSet:Set = ["chocolate","vanilla","chocolate"]
var mutableSet:Set = ["butterscotch","strawberry"]
for item in immutableSet{
    //print(item)
}
for item in mutableSet{
    //print("[\(String(number))] - "+item)
    //number+=1
}
//测试包含关系
immutableSet.contains("chocolate")
//添加项目
mutableSet.insert("green tea")
//移除项目，如果没有找到项目，则返回nil
let flavorWasRemoved:String? = mutableSet.remove("strawberry")
//print(flavorWasRemoved ?? "没有找到对应key")
number = 0
for item in mutableSet{
    //print("[\(String(number))] - "+item)
    //number+=1
}
print("9.控制流：循环")
//遍历一个列表或集合
//for item in listOrSet{
//    print(item)
//}
//遍历字典
//for (key,value) in dictionary{
//    print("\(key)=\(value)")
//}
//遍历范围
//闭区间操作符(...)
for i in 0...10{
    //print(i)
}
//半开区间操作符(..<)
for i in 0..<10{
    //print(i)
}
for i in 1..<10{
    //print(i)
}
//while
var x = 0
while x<10 {
    x+=1
    //print(x)
}
//repeate-while
repeat{
    x-=1
    //print(x)
}while(x>0)
print("10.控制流：条件语句")
//使用if来选择不同路径
number = 88
if(number<=10){
    //如果number<=10则执行这里
}else if(number>10 && number<100){
    
}else{
    
}
//三元操作符
let height = 100
let isTall = height>200 ? true : false
//print(isTall)
//如果不满足一个或多个条件，请使用guard将程序控制权转移出一个范围
for n in 1...20{
    guard n % 2 == 0 else {
        //不满足条件
        //print("\(n) 不能被2整除")
        continue
    }
    //满足条件
    //print("\(n) 能被2整除")
}
//使用switch来选择不同路径
let year = 2012
switch year {
case 2003,2004:
    print("Panther or Tiger")
case 2010:
    print("Lion")
case 2012...2015:
    //print("Mountain Lion through EL Caption")
    fallthrough
default:
    print("Not already classified")
}
print("11.函数")
//返回Void的函数
//func sayHello() {
    //print("Hello")
//}
//带参数的函数
//func sayHello(name:String) {
//    //print("Hello \(name)")
//}
//带默认参数值的函数
func sayHello(name: String = "Lorenzo") {
  print("Hello \(name)!")
}
//sayHello()
//sayHello(name: "倪新生")
//混合默认值的参数和常规参数的函数
func sayHello(name: String = "Lorenzo",age: Int) {
    print("\(name) is \(age) years old.")
}
//sayHello(age: 28)
//带参数和返回值的函数
func add(x: Int,y: Int) -> Int {
    return x + y
}
let value = add(x: 8, y: 10)
//print(value)
//如果函数只是一个表达式，可以省略return
func multiply(x: Int,y: Int) -> Int {
    x+y
}
//指定参数的label 标签
func add2(x xvalue: Int,y yvalue: Int) -> Int {
    xvalue + yvalue
}
//省略一些参数的参数label
func add3(_ x: Int,y: Int) -> Int {
    x+y
}
//let value2 = add3(8, y: 19)
//接受函数作为参数的函数
func doMath(operation:(Int,Int)->Int, a:Int,b:Int) -> Int {
    return operation(a,b)
}
print("12.闭包")
let adder:(Int,Int) -> Int = {
    (x,y) in x + y
}
//带有速记参数名的闭包
let square:(Int) -> Int = {$0*$0}
//将一个闭包传递给函数
let addWithClosure = doMath(operation: adder, a: 2, b: 4)
print("13.枚举")

enum Taste {
    case sweet,sour,salty,bitter,umami
}
//迭代枚举
enum Food:CaseIterable {
    case pasta,pizza,hamburger
}
for food in Food.allCases{
    //print(food)
}
//带有String原始值的枚举
enum Currency:String {
    case euro="EUR"
    case dollar = "USD"
    case pound = "GBP"
}
let euroSymbol = Currency.euro.rawValue
//print(euroSymbol)
//带有关联值的枚举
enum Content {
    case empty
    case text(String)
    case number(Int)
}
let content = Content.text("HELLO")
switch content{
case .empty:
    print("Value is Empty")
case .text(let value)://提取String值
    print("Value is \(value)")
case .number(_)://忽略Int值
    print("Value is a number")
}
print("14.结构体")
struct User{
    var name: String
    var age: Int = 40
}
//结构体自动创建一个逐一构造器，该构造器接收与x所有属性匹配的参数
let john = User(name: "JOHN", age: 35)
//如果属性有初始值，逐一构造器会将其作为默认参数值
let dave = User(name:"Dave")
//print("\(john.name) is \(john.age) years old.")
print("15.类")

class Person {
    let name:String
    //类构造
    init(name:String) {
        self.name = name
    }
    //使用deinit来执行对象资源的清理操作
    deinit {
        print("Perform the deinitialization")
    }
    var numberOfLaughs:Int = 0
    func laugh() {
        numberOfLaughs += 1
    }
    //定义一个计算属性
    var isHappy:Bool{
        return numberOfLaughs>0
    }
}

let david = Person(name: "nixs")
david.laugh()
let happy = david.isHappy
//print(happy)
//继承
class Student: Person {
    var numberOfExams:Int = 0
    //重写isHappy计算属性，以提供额外逻辑
    override var isHappy: Bool{
        numberOfLaughs>0 && numberOfExams>2
    }
}
let  ray = Student(name: "RAY")
ray.numberOfExams = 4
ray.laugh()
let happy2 = ray.isHappy
//print(happy2)
//用final来标记Child，以阻止其被继承
final class Child:Person{}
//指定构造器和便捷构造器
//一个类需要至少一个指定构造器
//同时可以有一个或多个便捷构造器
class ModeOfTransportation {
    let name:String
    //定义一个指定构造器
    //其携带一个名为name的参数
    init(name:String) {
        self.name = name
    }
    //定义一个便捷构造器
    //没有携带参数
    convenience init() {
        //委托给内部指定构造器
        self.init(name:"Not classified")
    }
}
class Vehicle: ModeOfTransportation {
    let wheels:Int
    //定义一个指定构造器
    //带有两个参数
    init(name:String,wheels:Int) {
        self.wheels = wheels
        //委托给父类指定构造器
        super.init(name:name)
    }
    override convenience init(name:String) {
        //委托给内部指定构造器
        self.init(name:name,wheels:4)
    }
}
print("16.扩展")
//扩展可以给已存在的类、结构体、枚举或协议类型添加新的功能
extension String{
    //拓展String类型来计算一个String实例是真还是假
    var boolValue:Bool{
        if self == "1" {
            return true
        }
        return false
    }
}
let isTrue = "0".boolValue
print("17.错误处理")
//表示一个错误
enum beverageMachineError:Error {
    case invalidSelection
    case insufficientFunds
    case outOfStock
}
func selectBeverage(_ selection:Int)throws -> String {
    //some logic here
    return "Waiting for beverage"
}
//如果在do代码块中抛出一个异常，它会与catch子句匹配，以确定其中哪一个可以处理错误
let message:String
do {
    message = try selectBeverage(20)
} catch beverageMachineError.invalidSelection {
    print("Invalid selection")
} catch beverageMachineError.insufficientFunds {
    print("Insufficient funds")
} catch beverageMachineError.outOfStock {
    print("Out of stock")
} catch {
    print("Generic error")
}
//如果try?语句中抛出一个错误，则表达式的值为nil
let nillableMessage = try?selectBeverage(10)
//如果抛出一个异常，则会导致运行时错误，否则获取返回值
let throwableMessage = try!selectBeverage(10)

print("18.访问控制")
//一个模块（framework或application）是一个独立的代码分发单元，可以在其它模块中通过import关键字来导入
public class AccessLevelsShowcase{//可以从其他模块中访问类
    public var somePublicProperty = 0 //可以从其他模块中访问属性
    var someInternameProperty = 0 //可以在包含该类的块中访问该属性
    fileprivate func someFilePrivateMethod(){}//可以从定义该类的源文件中访问该属性
    private func somePrivateMethod(){}//可以在该类的代码块中访问该属性
}
print("19.协议")
//Codable和Decodable/Encodable两个协议的组合是一样的

struct UserInfo:Codable {
    let username:String
    let loginCount:Int
}
//实现CustomStringConvertible协议来提供将实例转化字符串时的描述信息
extension UserInfo:CustomStringConvertible{
    var description: String{
        return "\(username) has tried to login \(loginCount) times"
    }
}
//定义一个表达json的多行字符串
let json = """
{ "username": "David", "loginCount": 2 }
"""
//使用JONSDecoder来序列化一个JSON
let decoder = JSONDecoder()
//将字符串转化为UserInfo实例
let data = json.data(using: .utf8)!
let userinfo = try!decoder.decode(UserInfo.self, from: data)
print(userinfo)


