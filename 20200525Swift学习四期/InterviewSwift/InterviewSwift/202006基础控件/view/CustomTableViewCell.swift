//
//  CustomTableViewCell.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let imageView_W = 120.0//w:h = 4:3
    let imageView_H = 90.0
    let subView_interval:CGFloat = 10.0
    
    var leftImageView:UIImageView?
    var nameLabel:UILabel?
    var subNameLabel:UILabel?
    var timeLabel:UILabel?
    var browseLabel:UILabel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.createCellUI()
    }
    
    func createCellUI() {
        leftImageView = UIImageView.init(frame : CGRect(x:15.0,y:5.0,width:imageView_W,height:imageView_H))
        leftImageView!.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(leftImageView!)
        leftImageView?.image = UIImage(named: "SH")
        leftImageView?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.width.equalTo(imageView_W)
            make.height.equalTo(imageView_H)
            make.left.equalTo(self.contentView).offset(kMargin)
        })
        
        //name
        nameLabel = UILabel()
        nameLabel?.textColor = UIColor.darkText
        nameLabel?.font = UIFont.systemFont(ofSize: 18)
        nameLabel?.text = "世界杯开幕";
        self.contentView.addSubview(nameLabel!)
        nameLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView.snp.top).offset(kMargin)
            make.left.equalTo(leftImageView!.snp.right).offset(kMargin)
        })
                
        subNameLabel = UILabel()
        subNameLabel?.textColor = UIColor.darkGray
        subNameLabel?.font = UIFont.systemFont(ofSize: 15)
        subNameLabel?.text = "世界杯开幕";
        self.contentView.addSubview(subNameLabel!)
        subNameLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(nameLabel!)
        })
        
        timeLabel = UILabel()
        timeLabel?.textColor = UIColor.lightGray
        timeLabel?.font = UIFont.systemFont(ofSize: 13)
        timeLabel?.text = "2018-01-01 10:58"
        self.contentView.addSubview(timeLabel!)
        timeLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-kMargin)
            make.left.equalTo(nameLabel!)
            make.width.equalToSuperview().multipliedBy(0.5)
        })
         
        browseLabel = UILabel.init()
        browseLabel?.textAlignment = NSTextAlignment.right
        browseLabel?.textColor = UIColor.lightGray
        browseLabel?.font = UIFont.systemFont(ofSize: 13)
        browseLabel?.text = "浏览："+"50"
        self.contentView.addSubview(browseLabel!)
        browseLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(timeLabel!)
            make.right.equalTo(self.contentView.snp.right).offset(-kMargin)
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
