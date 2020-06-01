//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/**
 1.private访问级别所修饰的属性或者方法只能在当前类里访问
 2.fileprivate 访问级别所修饰的属性或者方法在当前Swift源文件里可以访问。
 3.internal(默认访问级别，internal修饰符可写可不写)
    internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问
    如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
    如果是App代码，也是在整个App代码，也是在整个App内部可以访问
 4.public 可以被任何人访问，但其他module中不可以被override和集成，而在module内可以被继承
 5.open 可以被任何人使用，包括override和继承
 
 二、5种修饰符访问权限排序
 从高到低排序如下：
 1
 open > public > interal > fileprivate > private
 */


class A{
    private func test(){
        print("this is fileprivate func")
    }
    fileprivate func test2(){
        print("this is fileprivate func")
    }
    internal func test3(){
        print("this is fileprivate func")
    }
    public func test4(){
        print("this is fileprivate func")
    }
    open func test5(){
        print("this is fileprivate func")
    }
}
class B {
    func show() {
        //A是有默认构造的
        A.init().test2()
        A.init().test3()
        A.init().test4()
        A.init().test5()
    }
}

//: [Next](@next)
