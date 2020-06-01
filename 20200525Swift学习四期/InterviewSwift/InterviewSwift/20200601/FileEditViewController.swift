//
//  FileEditViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/1.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

//[18.Swift - 文件，文件夹操作大全](https://www.hangge.com/blog/cache/detail_527.html)
class FileEditViewController: BaseViewController,UITextFieldDelegate {

    lazy var labTitle: UILabel = {
        let labTitle = UILabel()
        labTitle.text = "标题"
        labTitle.shadowColor = .red
        labTitle.shadowOffset = CGSize(width: 1.5, height: 1.5)//阴影偏移量
        labTitle.font = CustomFont(font: 30)
        return labTitle
    }()
    var textField:UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fileOperation()
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    /// 布局
    func initView() {        
        self.view.addSubview(labTitle)
        labTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin).offset(kMargin)
            make.leading.equalToSuperview().offset(kMargin)
            make.trailing.equalToSuperview().offset(-kMargin)
            make.height.equalTo(kMargin*5)
        }
        
        //富文本设置
        let attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSAttributedString.Key.font,
                                     value: UIFont(name: "HelveticaNeue-Bold", size: 35)!,
                                     range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue,
                                     range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.green,
                                     range: NSMakeRange(3,3))
        labTitle.attributedText = attributeString
                
        //UITextField
        let textField = UITextField(frame: CGRect(x:10, y:60, width:200, height:30))
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        //如果要修改圆角半径的话需要将maskToBounds设置为true
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.red.cgColor
        
        textField.placeholder = "请输入用户名"
        
        textField.clearButtonMode = .always
        
        //textField.isSecureTextEntry = true//输入内容会显示成小黑点
        
        //textField.keyboardType = .numberPad
        
        textField.returnKeyType = .done
        
        textField.delegate = self
        
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(labTitle.snp.bottom).offset(kMargin)
            make.left.right.equalTo(labTitle)
            make.height.equalTo(kMargin*5)
        }
        
        textField.becomeFirstResponder()
        
        //--------------------
        self.view.addSubview(uiSwitch)
        uiSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(kMargin)
            make.centerX.equalToSuperview()
        }
        
    }
    lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = true
        uiSwitch.addTarget(self, action: #selector(switchDidChange), for: .valueChanged)
        return uiSwitch
    }()
    
    @objc func switchDidChange(){
        //打印当前值
        print("UISwitch状态：\(uiSwitch.isOn)")
        
    }
    
    /// 实现代理方法
    /// - Parameter textField: 目标输入框
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        print("打印出文本框内容：\(textField.text ?? "")")
        return true
    }
    
    /// 文件操作
    func fileOperation() {
        let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urlForDocument[0] as URL
        print(url)
        
        
        let contentOfPath = try?manager.contentsOfDirectory(atPath: "./")
        print("contentOfPath:\(contentOfPath!)")
        
        let filePath:String = NSHomeDirectory() + "/Documents/hangge.txt"
        print(filePath)
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
