//
//  JRLoginTableViewCell.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/9.
//  Copyright © 2020 nixs. All rights reserved.
//
//自定义cell代码
import UIKit
//声明代理协议
protocol btnClickDelegate {
    //代理方法
    func btnClickMethod(tag:Int,andContent:String)
}
class JRLoginTableViewCell: UITableViewCell {
    //代理属性
    public var delegate:btnClickDelegate?
    
    //定义blocK
    typealias fucBlock = (String,Int)->()
    //创建block变量
    var blockproerty:fucBlock!
    
    @IBOutlet weak var getCodeBtn: UIButton!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .gray
    }

    @IBAction func getCodeClick(_ sender: Any) {
        print("获取验证码")
        if delegate != nil {
            delegate?.btnClickMethod(tag: 1,andContent: "获取验证码-代理传值")
        }
        
        //block调用
        if let _ = blockproerty {
            blockproerty("121212",1)
        }
    }
    
    @IBAction func commitClick(_ sender: Any) {
        print("马上开启")
        if delegate != nil {
            delegate?.btnClickMethod(tag: 1,andContent: "马上开启-代理传值")
        }
        
        //block调用
        if let _ = blockproerty {
            blockproerty("343434",2)
        }
    }
    
    @IBAction func textEidDidEnd(_ sender: UITextField) {
        print(sender.text as Any)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
