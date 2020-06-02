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
        
        textField.keyboardType = .numberPad
        
        textField.returnKeyType = .done
        
        textField.delegate = self
        
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(labTitle.snp.bottom).offset(kMargin)
            make.left.right.equalTo(labTitle)
            make.height.equalTo(kMargin*5)
        }
        
        //textField.becomeFirstResponder()
        
        //---------UISwitch-----------
        self.view.addSubview(uiSwitch)
        uiSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(kMargin)
            make.centerX.equalToSuperview()
        }
        //----------UISegmentedControl----------
        self.view.addSubview(segmented)
        segmented.snp.makeConstraints { (make) in
            make.top.equalTo(uiSwitch.snp.bottom).offset(kMargin)
            make.leading.equalTo(kMargin*3)
            make.trailing.equalTo(-kMargin*3)
            make.height.equalTo(kMargin*4)
        }
        //添加文字选项
        segmented.insertSegment(withTitle: "选项四", at: 3, animated: true)
        //----------UI----------
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(segmented.snp.bottom).offset(kMargin)
            make.left.right.equalTo(segmented)
            make.height.equalTo(kMargin*5)
        }
        //----------UIProgressView----------
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(kMargin)
            make.left.right.equalTo(imageView)
            make.height.equalTo(kMargin/2)
        }
        //延迟执行
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
            self.progressView.setProgress(0.6, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.5) {
            self.progressView.setProgress(0.99, animated: true)
        }
        //----------UI----------
        
        //----------UI----------
        //----------UI----------
        //----------UI----------
        //----------UI----------
        //----------UI----------
        
                
    }
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.3//默认进度
        progressView.progressTintColor = .green//已有的进度颜色
        progressView.trackTintColor = .gray//剩余进度颜色(即进度槽颜色)
        return progressView
    }()
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        //异步图片加载
        DispatchQueue.global().async {
            do{
                //定义URL对象
                let url = URL(string: "http://hangge.com/blog/images/logo.png")
                //从网络获取数据流
                let data = try Data(contentsOf: url!)
                //通过数据流初始化图片
                let newImage = UIImage(data: data)
                
                DispatchQueue.main.async {
                    imageView.image = newImage
                    imageView.layer.borderColor = UIColor.red.cgColor
                    imageView.layer.borderWidth = 2.0
                    imageView.layer.cornerRadius = 3.0
                }
            }catch{
                print(error)
            }
        }
        return imageView
    }()
    
    lazy var segmented: UISegmentedControl = {
        //选项除了文字还可以是图片
        let items = ["选项一","选项二",UIImage(named: "coder")!] as [Any]
        let segmented = UISegmentedControl(items: items)
        segmented.selectedSegmentIndex = 0 //默认选中第一项目
        segmented.tintColor = .red
        segmented.addTarget(self, action: #selector(self.segemntDidChange(_:)), for: .valueChanged)
        return segmented
    }()
    
    lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = true
        uiSwitch.addTarget(self, action: #selector(switchDidChange), for: .valueChanged)
        return uiSwitch
    }()
    
    /// 分段控制器选择触发事件
    /// - Parameter segemnted: segemnted description
    @objc func segemntDidChange(_ segemnted:UISegmentedControl) {
        //获得选项的索引
        print("获得选项的索引:\(segmented.selectedSegmentIndex)")
        print("获得选择的文字:\(String(describing: segmented.titleForSegment(at: segemnted.selectedSegmentIndex)))")
    }
    
    /// UISwitch开关触发事件
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
