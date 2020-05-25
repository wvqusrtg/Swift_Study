//
//  Common.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/25.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

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



