//
//  UIScrollViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/3.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class UIScrollViewController: BaseViewController {
    let numOfPages = CGFloat(3)
    let pageWidth = kScreenW-kMargin
    let pageHeight = CGFloat(300)
    override func viewDidLoad() {
        super.viewDidLoad()
        //----------UIScrollView----------
        //scrollView的初始化
        let scrollView = UIScrollView()
        //scrollView.frame = self.view.bounds
        //为了能让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize = CGSize(width: pageWidth*numOfPages, height: pageHeight)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.scrollsToTop = false
        
        //添加子页面
        for i in 0..<Int(numOfPages){
            let sonVC = SonViewController(number: (i+1))
            sonVC.view.frame = CGRect(x: pageWidth * CGFloat(i), y: 0, width: pageWidth, height: pageHeight)
            scrollView.addSubview(sonVC.view)
        }
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp_topMargin).offset(kMargin)
            make.left.right.equalToSuperview()
            make.height.equalTo(pageHeight)
        }
        
        //----------UIDatePicker----------
        self.view.addSubview(self.datePicker)
        self.datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.bottom).offset(kMargin)
            make.leading.equalTo(kMargin)
            make.trailing.equalTo(-kMargin)
            make.height.equalTo(kMargin*10)
        }
        //倒计时
        countDownTime()
        
        //----------UI----------
        
    }
    
    var ctimer:UIDatePicker!
    var btnstart:UIButton!
    var leftTime:Int = 180
    var alertController:UIAlertController!
    var timer:Timer!
    func countDownTime() {
        self.ctimer = UIDatePicker()
        self.ctimer.datePickerMode = UIDatePicker.Mode.countDownTimer
        //必须为60的整数倍，比如设置为100，值会自动变为60
        self.ctimer.countDownDuration = TimeInterval(leftTime)
        self.ctimer.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        self.view.addSubview(self.ctimer)
        self.ctimer.snp.makeConstraints { (make) in
            make.top.equalTo(self.datePicker.snp.bottom).offset(kMargin)
            make.left.right.height.equalTo(self.datePicker)
        }
        //触发按钮
        self.btnstart = UIButton(type: .system)
        self.btnstart.setTitleColor(.red, for: .normal)
        self.btnstart.setTitleColor(.green, for: .disabled)
        self.btnstart.setTitle("开始", for: .normal)
        self.btnstart.setTitle("倒计时中", for: .disabled)
        self.btnstart.clipsToBounds = true
        self.btnstart.layer.cornerRadius = 5.0
        self.btnstart.addTarget(self, action: #selector(startClicked(sender:)), for: .touchUpInside)
        self.view.addSubview(self.btnstart)
        self.btnstart.snp.makeConstraints { (make) in
            make.top.equalTo(self.ctimer.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self.ctimer)
            make.height.equalTo(kMargin*5)
        }
    }
    @objc func timeChanged(){
        print("您选择倒计时时间为：\(self.ctimer.countDownDuration)")
    }
    
    /// 开始倒计时按钮点击
    /// - Parameter sender: sender description
    @objc func startClicked(sender:UIButton){
        self.btnstart.isEnabled = false
        //获取d该倒计时的剩余时间
        leftTime = Int(self.ctimer.countDownDuration)
        //禁用UIDatePicker控件和按钮
        self.ctimer.isEnabled = false
        //创建一个UIAlertController对象(警告框)，并确认，倒计时开始
        self.alertController = UIAlertController(title: "系统提示", message: "倒计时开始，还有\(leftTime)秒...", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        self.alertController.addAction(cancelAction)
        //显示UIAlertController组件
        self.present(self.alertController, animated: true, completion: nil)
        //启用计时器，控制每秒执行一次tickDown方法
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
    }
    @objc func tickDown() {
        self.alertController.message = "倒计时开始，还有\(leftTime)秒..."
        //将剩余时间减少1s
        leftTime -= 1
        //修改UIDatePicker剩余时间
        DispatchQueue.main.async {
            self.ctimer.countDownDuration = TimeInterval(self.leftTime)
        }
        print(leftTime)
        if leftTime<=0 {
            //如下方法应封装起来，本页面关闭也要调用一次如下方法！！！
            //取消定时器
            self.timer.invalidate()
            //启用UIDatePicker控件和按钮
            self.ctimer.isEnabled = true
            self.btnstart.isEnabled = true
            self.alertController.message = "时间到！"
        }
    }
    
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        //将i日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        datePicker.layer.borderColor = UIColor.red.cgColor
        datePicker.layer.borderWidth = 2.0
        datePicker.layer.cornerRadius = 5.0
        //改变控件时间选择模式
        //datePicker.datePickerMode = .date
        //datePicker.datePickerMode = .time
        datePicker.datePickerMode = .dateAndTime
        datePicker.setValue(UIColor.red, forKey: "textColor")
        return datePicker
    }()
    
    @objc func dateChanged(datePicker:UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(formatter.string(from: datePicker.date))
        showTextWithHUD(toView: self.view, textTitle: nil, textMsg: formatter.string(from: datePicker.date))
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
