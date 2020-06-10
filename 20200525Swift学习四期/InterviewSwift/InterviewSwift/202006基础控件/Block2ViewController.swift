//
//  Block2ViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/9.
//  Copyright © 2020 nixs. All rights reserved.
//

import Foundation

//无参数无返回值
typealias funcBlock = ()->() //或者 ()->Void
//返回值是String
typealias funcBlockA = (Int,Int)->String
//返回值是一个函数指针，入参为String
typealias funcBlockB = (Int,Int)->(String)->()
//返回值是一个函数指针，入参为String 返回值也是String
typealias funcBlockC = (Int,Int)->(String)->String

class Block2ViewController {

    //block作为属性变量
    var blockProperty : (Int,Int)->String = {a,b in return "" }
    var blockPropertyNoReturn : (String) -> () = {param in }
    
    var blockPropertyA:funcBlockA?//这写法就可以初始化为nil了，因为生命周期中，（理想状态）可能为nil所以用？
    var blockPropertyB:funcBlockB!//这写法也可以初始化为nil了，因为生命周期中，（理想状态）认为不可能为nil，所以用！
    
    init(){
        print("blockPropertyA = \(String(describing: blockPropertyA)),blockPropertyB = \(blockPropertyB)")
        print("blockProperty = \(String(describing: blockProperty)),blockPropertyNoReturn = \(blockPropertyNoReturn)")
    }
    
    func testProperty(tag:Int) -> Void {
        switch tag {
        case 1:
            self.blockPropertyNoReturn("OK GOOD")
        case 2:
            if self.blockPropertyA != nil {
                let result = self.blockPropertyA!(7,8)
                print("result = \(result)")
            }
        case 3:
            if self.blockPropertyB != nil {
                let fc = self.blockPropertyB(1,2)
                print("输出 fc=\(String(describing: fc))")
            }
        default:
            let ret = self.blockProperty(3,4)
            print(ret)
        }
    }
    
    /// block作为函数参数
    /// - Parameter blockfunc: blockfunc description
    func testBlock(blockfunc:funcBlock!){//使用!号不需要再解包
        if blockfunc != nil{
            blockfunc()//无参无返回
        }
    }
    func testBlockA(blockfunc:funcBlockA!){
        if blockfunc != nil{
            let retstr = blockfunc(5,6)
                print(retstr)
            }
    }
    func testBlockB(blockfunc:funcBlockB!){
        if blockfunc != nil{
            let retfunc = blockfunc(5,6)
            retfunc("结果是")
        }
    }
    func testBlockC(blockfunc:funcBlockC!){
        if blockfunc != nil{
            let retfunc = blockfunc(5,6)
            let str = retfunc("最终果结是")
            print(str)
        }
    }
}
