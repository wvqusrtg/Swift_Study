//
//  Common.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/25.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import MBProgressHUD

/// 屏幕宽高
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
let kMargin = 10


/// RGBColor
/// - Parameters:
///   - r: r
///   - g: g
///   - b: b
///   - alp: 透明度
func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat,alp:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alp)
}

/// 自定义MBProgressHUD提示框-by:nixs 2020年06月01日09:05:18
/// - Parameters:
///   - toView: 目标显示View
///   - textTitle: 标题
///   - textMsg: 详细内容
func showTextWithHUD(toView:UIView,textTitle:String?,textMsg:String?) -> Void {
    let hud = MBProgressHUD.showAdded(to: toView, animated: true)
    hud.mode = MBProgressHUDMode.text
    hud.label.text = textTitle
    hud.detailsLabel.text = textMsg
    //延迟隐藏
    hud.hide(animated: true, afterDelay: 0.8)
}


