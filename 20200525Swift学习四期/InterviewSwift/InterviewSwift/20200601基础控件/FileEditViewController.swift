//
//  FileEditViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/1.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

//[18.Swift - 文件，文件夹操作大全](https://www.hangge.com/blog/cache/detail_527.html)
class FileEditViewController: BaseViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate {

    lazy var labTitle: UILabel = {
        let labTitle = UILabel()
        labTitle.text = "标题"
        labTitle.shadowColor = .red
        labTitle.shadowOffset = CGSize(width: 1.5, height: 1.5)//阴影偏移量
        labTitle.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.5)
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
        //----------UIImageView----------
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
        //----------UISlider----------
        self.view.addSubview(self.slider)
        self.slider.snp.makeConstraints { (make) in
            make.top.equalTo(progressView.snp.bottom).offset(kMargin)
            make.left.right.equalTo(progressView)
            make.height.equalTo(kMargin/2)
        }
        //延迟执行
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
            self.slider.setValue(0.6, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.5) {
            self.slider.setValue(0.99, animated: true)
        }
        //----------UIAlertController----------
        self.view.addSubview(self.btnUIAlertController)
        self.btnUIAlertController.snp.makeConstraints { (make) in
            make.top.equalTo(self.slider.snp.bottom).offset(kMargin*1.5)
            make.left.right.equalTo(self.slider)
            make.height.equalTo(kMargin*5)
        }
        //----------UIPickerView----------
        self.view.addSubview(self.pickView)
        self.pickView.snp.makeConstraints { (make) in
            make.top.equalTo(self.btnUIAlertController.snp.bottom).offset(kMargin*1.5)
            make.left.right.equalTo(self.btnUIAlertController)
            make.height.equalTo(kMargin*10)
        }
        //----------UIScrollView----------
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pickView.snp.bottom).offset(kMargin*1.5)
            make.left.right.equalTo(self.pickView)
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
        //----------UI----------
        
        
        //----------UI----------
        
                
    }
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        let imageView = UIImageView(image: UIImage(named: "SH"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1 //最小比例
        scrollView.maximumZoomScale = 3 //最大比例
        return scrollView
    }()
    //视图滚动中一直触发
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    //手势放大缩小
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for subView:AnyObject in scrollView.subviews {
            if subView.isKind(of: UIImageView.self) {
                return subView as?UIView
            }
        }
        return nil
    }
    
    lazy var pickView: UIPickerView = {
        let pickView = UIPickerView()
        pickView.dataSource = self
        pickView.delegate = self
        pickView.selectRow(1, inComponent: 0, animated: true)
        pickView.selectRow(2, inComponent: 1, animated: true)
        pickView.selectRow(3, inComponent: 2, animated: true)
        pickView.layer.borderColor = UIColor.red.cgColor
        pickView.layer.borderWidth = 2.0
        pickView.layer.cornerRadius = 5.0
        return pickView
    }()
    //如下实现pickView的代理方法
    //设置选择框的列数为3列，继承与UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //设置选择框的行数为9行，继承与UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)+"-"+String(component)
    }
    //监测响应选项的选择状态
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        print("component=\(component),row=\(row)")
    }
    //行内容自定义
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 13)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = String(row)+"-"+String(component)
        pickerLabel?.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.5)
        pickerLabel?.textColor = UIColor.blue
        return pickerLabel!
    }
    
    lazy var btnUIAlertController: UIButton = {
        let btnUIAlertController = UIButton()
        btnUIAlertController.setTitle("UIAlertController", for: .normal)
        btnUIAlertController.setTitleColor(.white, for: .normal)
        btnUIAlertController.backgroundColor = .red
        btnUIAlertController.addTarget(self, action: #selector(alertControllerClicked(_:)), for: .touchUpInside)
        btnUIAlertController.layer.cornerRadius = 5
        return btnUIAlertController
    }()
    
    /// UIAlertController点击事件
    /// - Parameter alertController: alertController description
    @objc func alertControllerClicked(_ alertContol:UIAlertController) {
        
        let alertController = UIAlertController(title: "系统提示", message: "您确定要离开吗？", preferredStyle: .alert)
        //let alertController = UIAlertController(title: "系统提示", message: "您确定要离开吗？", preferredStyle: .actionSheet)
        
        alertController.addTextField { (UITextField) in
            UITextField.placeholder = "用户名"
        }

        alertController.addTextField { (UITextField) in
            UITextField.placeholder = "密码"
            UITextField.isSecureTextEntry = true
        }

        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
            showTextWithHUD(toView: self.view, textTitle: "温馨提示", textMsg: "您点击了取消按钮")
        }
        let okAction = UIAlertAction(title: "确定", style: .default) { (UIAlertAction) in
            let login = alertController.textFields!.first!
            let pwd = alertController.textFields!.last!

            showTextWithHUD(toView: self.view, textTitle: "温馨提示", textMsg: "您点击了确定按钮 login=\(String(describing: login.text)) pwd=\(String(describing: pwd.text))")
        }
        let otherAction = UIAlertAction(title: "OtherAction", style: .default) { (UIAlertAction) in
            showTextWithHUD(toView: self.view, textTitle: "温馨提示", textMsg: "您点击了OtherAction按钮")
            //用代码移除提示框
            self.presentedViewController?.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        alertController.addAction(otherAction)
        self.present(alertController, animated: true, completion: nil)
                
        //----------------------------------------------------------------------
//        let alertController = UIAlertController(title: "保存成功", message: "详细信息...", preferredStyle: .alert)
//        self.present(alertController, animated: true, completion: nil)
//        //两秒钟后消失
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
//            self.presentedViewController?.dismiss(animated: true, completion: nil)
//        }
        
        
    }
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.3//当前默认值
        slider.isContinuous = false//滑块滑动停止后才触发ValueChanged事件
        slider.addTarget(self, action: #selector(sliderDidchange(_:)), for: .valueChanged)
        
        slider.minimumTrackTintColor = UIColor.red //左边槽的颜色
        slider.maximumTrackTintColor = UIColor.green //右边槽的颜色
        
        slider.minimumValueImage = UIImage(named:"voice+")  //左边图标
        slider.maximumValueImage = UIImage(named:"voice-")  //右边图标
        
        //设置滑块右边部分的图片
        slider.setMaximumTrackImage(UIImage(named:"slider_max"),for: .normal)
        //设置滑块左边部分的图片
        slider.setMinimumTrackImage(UIImage(named:"slider_min"),for: .normal)
        //设置滑块的图片
        slider.setThumbImage(UIImage(named:"slider_thumb"),for: .normal)
        
        //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
//        let imgTrackRight = UIImage(named:"slider_max")
//        let imgRight = imgTrackRight!.stretchableImage(withLeftCapWidth: 14, topCapHeight:0)
//        slider.setMaximumTrackImage(imgRight, for: .normal)
        
        return slider
    }()
    
    @objc func sliderDidchange(_ slider:UISlider){
        print(slider.value)
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
