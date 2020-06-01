//
//  HomeViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/25.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {

    lazy var defaultImgView: UIImageView = {
        let defaultImageView = UIImageView()
        defaultImageView.image = UIImage.init(named: "coder")
        return defaultImageView
    }()
    
    lazy var labelDesc: UILabel = {
        let labelDesc = UILabel()
        labelDesc.text = "页面找不到了..."
        labelDesc.numberOfLines = 0
        labelDesc.textAlignment = NSTextAlignment.center
        labelDesc.textColor = .red
        return labelDesc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "页面找不到了..."
        initView()
    }
    
    /// 初始化视图
    func initView() {
        self.view.addSubview(defaultImgView)
        defaultImgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(kScreenW/5)
            make.center.equalToSuperview()
        }
        
        self.view.addSubview(labelDesc)
        labelDesc.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalToSuperview()
            ConstraintMaker.top.equalTo(defaultImgView.snp_bottomMargin).offset(kMargin)
        }
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
