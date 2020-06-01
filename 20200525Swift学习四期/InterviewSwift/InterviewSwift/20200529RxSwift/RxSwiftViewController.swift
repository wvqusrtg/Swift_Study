//
//  RxSwiftViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/29.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

/// Cocoapods能更新了
/// https://beeth0ven.github.io/RxSwift-Chinese-Documentation/

class RxSwiftViewController: BaseViewController {
    lazy var btnTitle: UIButton = {
        let btnTitle = UIButton()
        btnTitle.setTitle("测试点击事件", for: UIControl.State.normal)
        btnTitle.titleLabel?.textColor = .white
        btnTitle.backgroundColor = .red
        btnTitle.layer.cornerRadius = 5
        //点击事件
        //btnTitle.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btnTitle.rx.tap.subscribe({_ in
            //print("button Tapped - RxSwift/RxCocoa")
            //self.navigationController?.pushViewController(MusicViewController(), animated: true)
            showTextWithHUD(toView: self.view, textTitle: nil, textMsg: "RxSwift基础")
        })        
        return btnTitle
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    /// initView
    func initView() {
        self.view.addSubview(btnTitle)
        btnTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin).offset(kMargin/2)
            make.leading.equalTo(kMargin)
            make.trailing.equalTo(-kMargin)
            make.height.equalTo(5*kMargin)
        }
    }
    
    /// 按钮点击事件
    @objc func buttonTapped() {
        print("button Tapped")
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
