//
//  UIButtonViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/1.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class UIButtonViewController: BaseViewController {

    lazy var btn001: UIButton = {
        let btn001 = UIButton(type: UIButton.ButtonType.contactAdd)
        btn001.frame = CGRect(x: kMargin, y: kNavigationBarH+kMargin, width: kScreenW-2*kMargin, height: 10*kMargin)
        //let iconImg = UIImage(named: "coder")?.withRenderingMode(.alwaysOriginal)
        //btn001.setImage(iconImg, for: .normal)
        //btn001.imageRect(forContentRect: CGRect(x: kMargin/2, y: kMargin/2, width: 40, height: 40))
        //btn001.imageEdgeInsets = UIEdgeInsets(top: kMargin/2, left: kMargin/2, bottom: kMargin/2, right: kMargin/2)
        btn001.backgroundColor = .red
        btn001.titleLabel?.lineBreakMode = .byCharWrapping
        btn001.titleLabel?.numberOfLines = 0
        btn001.setTitle("创建一个ContactAdd类型的按钮 - 这个是一段 very 长的文字", for: .normal)
        btn001.setTitleColor(.white, for: .normal)
        btn001.layer.cornerRadius = 5.0
        btn001.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        btn001.rx.tap.subscribe({_ in
            let str = "Welcome to china."
            showTextWithHUD(toView: self.view, textTitle: str.lowercased(), textMsg: str.uppercased())
        })
        return btn001
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    func initView() -> Void {
        self.view.addSubview(btn001)
    }
    
    @objc func tapped() {
        showTextWithHUD(toView: self.view, textTitle: nil, textMsg: "tapped触发点击事件")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
