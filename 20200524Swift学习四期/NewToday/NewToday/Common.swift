//
//  Common.swift
//  NewToday
//
//  Created by ai-nixs on 2020/5/24.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

//屏幕宽高
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

//keyWindow
let keyWindow = UIApplication.shared.keyWindow

//判断是否是iphone
let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

//判断是否是iphone X
let kIsIphoneX = Bool(kScreenW >= 375.0 && kScreenH >= 812.0 && kIsIphone)

//导航条高度
let kNavigationBarH = CGFloat(kIsIphoneX ? 88 : 64)

//状态栏高度
let kStatusBarH = CGFloat(kIsIphoneX ? 44 : 20)

//tabbar高度
let kTabBarH = CGFloat(kIsIphoneX ? (49+34) : 49)

//自定义颜色
func RGBColor(r:CGFloat, g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}

//字号
func CustomFont(font:CGFloat) -> UIFont{
    //iphoneX类型-刘海屏手机
    guard kScreenH<=736 else {
        return UIFont.systemFont(ofSize: font)
    }
    //5.5寸
    guard kScreenH==736 else {
        return UIFont.systemFont(ofSize: font-2)
    }
    //4.7寸
    guard kScreenH>=736 else {
        return UIFont.systemFont(ofSize: font-4)
    }
    return UIFont.systemFont(ofSize: font)
}












