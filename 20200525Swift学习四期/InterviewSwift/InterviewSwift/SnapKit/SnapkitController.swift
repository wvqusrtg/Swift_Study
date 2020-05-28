//
//  SnapkitController.swift
//  InterviewSwift
//
//  Created by ai-nixs on 2020/5/6.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class SnapkitController: BaseViewController {
    //懒加载方式初始化控件
    //底层bgView
    lazy var bgView: UIView = {
        let uiveiw = UIView()
        uiveiw.backgroundColor = RGBColor(r: 100, g: 100, b: 100, alp: 0.5)
        return uiveiw
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "SnapKit框架解析（一） —— SnapKit应用的一个简单示例（一） --- 这里就可以联想尽快打通Object-C调用Swift/Swift调用Object-C 混编内容了"
        label.textColor = .red
        label.backgroundColor = RGBColor(r: 100, g: 200, b: 300, alp: 0.5)
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    //下半部分bottomView
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = RGBColor(r: 200, g: 300, b: 400, alp: 0.5)
        return bottomView
    }()
    
    //下半部分中间MiddleView
    lazy var bottomMiddleView: UIView = {
        let bottomMiddleView = UIView()
        bottomMiddleView.backgroundColor = RGBColor(r: 30, g: 800, b: 400, alp: 0.5)
        return bottomMiddleView
    }()
    
    //UPView
    lazy var bottomMiddleUPView: UIView = {
        let bottomMiddleUPView = UIView()
        bottomMiddleUPView.backgroundColor = RGBColor(r: 100, g: 200, b: 300, alp: 0.5)
        return bottomMiddleUPView
    }()
    //DOWNView
    lazy var bottomMiddleDOWNView: UIView = {
        let bottomMiddleDOWNView = UIView()
        bottomMiddleDOWNView.backgroundColor = RGBColor(r: 300, g: 200, b: 100, alp: 0.5)
        return bottomMiddleDOWNView
    }()
    
    lazy var centerView: UIView = {
        let centerView = UIView()
        centerView.backgroundColor = RGBColor(r: 150, g: 150, b: 150, alp: 0.5)
        return centerView
    }()
    
    lazy var leftView: UIView = {
        let leftView = UIView()
        leftView.backgroundColor = RGBColor(r: 15, g: 15, b: 15, alp: 0.5)
        return leftView
    }()
    lazy var rightView: UIView = {
        let rightView = UIView()
        rightView.backgroundColor = RGBColor(r: 20, g: 150, b: 50, alp: 0.5)
        return rightView
    }()
    lazy var leftRightCenterView: UIView = {
        let leftRightCenterView = UIView()
        leftRightCenterView.backgroundColor = RGBColor(r: 11, g: 22, b: 33, alp: 0.5)
        return leftRightCenterView
    }()
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView() {
        self.view.addSubview(bgView)
        //这里SnapKit使用了闭包
        bgView.snp.makeConstraints { (ConstraintMaker) in
            //注意这里直接就适配顶部和底部的安全距离了
            ConstraintMaker.top.equalTo(self.view.snp_topMargin).offset(kMargin);
            ConstraintMaker.bottom.equalTo(self.view.snp_bottomMargin).offset(-kMargin);
            ConstraintMaker.left.equalTo(kMargin)
            ConstraintMaker.right.equalTo(-kMargin)
        }
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp_topMargin).offset(kMargin)
            make.leading.equalTo(kMargin)
            make.trailing.equalTo(-kMargin)
        }
        bgView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(2*kMargin)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bgView.snp_bottomMargin).offset(-kMargin)
        }
        
        bottomView.addSubview(bottomMiddleView)
        bottomMiddleView.snp.makeConstraints { (make) in
            //make.top.left.bottom.right.equalToSuperview().inset(20)
            make.edges.equalToSuperview().inset(20)
        }
        
        bottomMiddleView.addSubview(bottomMiddleUPView)
        bottomMiddleUPView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kMargin)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        //更新约束
        bottomMiddleUPView.snp.updateConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
        }
        
        bottomMiddleView.addSubview(bottomMiddleDOWNView)
        bottomMiddleDOWNView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-kMargin)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5).offset(kMargin)
        }
        //更新约束
        bottomMiddleDOWNView.snp.updateConstraints { (make) in
            make.left.equalTo(kMargin)
            make.right.equalTo(-kMargin)
        }
                
        
        bottomMiddleUPView.addSubview(centerView)
        centerView.snp.makeConstraints { (make) in
            make.width.height.equalTo(kScreenW*0.5)
            make.center.equalToSuperview()
        }
        
        bottomMiddleDOWNView.addSubview(leftView)
        bottomMiddleDOWNView.addSubview(rightView)
        bottomMiddleDOWNView.addSubview(leftRightCenterView)
        leftView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(kMargin)
            make.width.height.equalToSuperview().multipliedBy(0.5).offset(-kMargin*3/2)
        }
        rightView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kMargin)
            make.right.equalToSuperview().offset(-kMargin)
            make.width.height.equalToSuperview().multipliedBy(0.5).offset(-kMargin*3/2)
        }
        leftRightCenterView.snp.makeConstraints { (make) in
            make.top.equalTo(leftView.snp_bottom).offset(kMargin)
            make.size.equalTo(leftView)
            make.centerX.equalToSuperview()
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
