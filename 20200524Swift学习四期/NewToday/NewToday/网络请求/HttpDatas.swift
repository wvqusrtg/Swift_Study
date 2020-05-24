
//
//  HttpDatas.swift
//  NewToday
//
//  Created by ai-nixs on 2020/5/24.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import Alamofire//网络请求三方

private let httpShareInstance = HttpDatas()

//数据请求方法
enum MothodType {
    case get
    case post
}

class HttpDatas: NSObject {
    //单例
    class var shareInstance: HttpDatas {
        return httpShareInstance
    }
}

extension HttpDatas{
    
    /// 网络请求通用版
    /// - Parameters:
    ///   - type: 数据请求方式 get/post
    ///   - URLString: 请求数据的路径
    ///   - paramaters: 请求数据需要的参数
    ///   - finishCallBack: 请求成功后通过这个block把数据回调
    /// - Returns: description
    func requestDatas(_ type:MothodType,URLString:String,paramaters:[String:Any]?,finishCallBack:@escaping(_ response:Any) -> ()) {
        //获取请求类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        //发送网络请求
        Alamofire.request(URLString, method: method, parameters: paramaters, encoding: URLEncoding.default, headers: nil).responseJSON { (responseJson) in
            //判断是否请求成功
            guard responseJson.result.value != nil else{
                //如果返回值nil,则打印具体错误信息，反之：返回值不为nil 往下走
                print(responseJson.result.error)
                return
            }
            
            //获取结果(如果请求成功-继续往下走，反之直接返回)
            guard responseJson.result.isSuccess else{
                return
            }
            
            //成功就把请求的数据回调过去
            if let value = responseJson.result.value {
                finishCallBack(value)
            }
        }
    }
}
