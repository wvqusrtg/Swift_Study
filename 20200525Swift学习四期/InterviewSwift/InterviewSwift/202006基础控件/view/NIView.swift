//
//  NIView.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class NIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    public var desc2 : UILabel = {
        let desc = UILabel()
        desc.numberOfLines = 0
        desc.backgroundColor = .gray
        desc.text = "default"
        return desc
    }()
        
    public let bottomLine : UIView = {
        let line = UIView()
        line.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width-20, height: 100)
        line.backgroundColor = UIColor.orange
        line.isHidden = false
        
        let icon = UIImageView()
        icon.image = UIImage.init(named: "coder")
        icon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        line.addSubview(icon)
        
        let desc = UILabel()
        desc.numberOfLines = 0
        desc.backgroundColor = .gray
        desc.text = "default"
        line.addSubview(desc)
        desc.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.top).offset(kMargin)
            make.left.equalTo(icon.snp.right).offset(kMargin)
            //make.right.equalTo(line.snp.right).offset(-kMargin)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalTo(line.snp.bottom).offset(-kMargin)
        }
        
        //line.addSubview(desc)
        
        return line
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bottomLine)
    }
    
}
