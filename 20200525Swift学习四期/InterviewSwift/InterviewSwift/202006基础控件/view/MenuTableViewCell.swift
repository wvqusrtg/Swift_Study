//
//  MenuTableViewCell.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/4.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var showImage:UIImageView?
    var firstTitle:UILabel?
    var subTitle:UILabel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setUpUI()
    }
    
    func setUpUI() {
        showImage = UIImageView()
        showImage!.layer.masksToBounds = true
        self.contentView.addSubview(showImage!)
        showImage?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView.snp.top).offset(kMargin)
            make.left.equalTo(self.contentView.snp.left).offset(kMargin)
            make.width.equalTo(kScreenW-20)
            make.height.equalTo(170)
        })
        
        subTitle = UILabel()
        subTitle?.font = UIFont.systemFont(ofSize: 15)
        subTitle?.textAlignment = NSTextAlignment.center
        subTitle?.textColor = UIColor.red
        self.contentView.addSubview(subTitle!)
        subTitle?.snp.makeConstraints({ (make) in
            make.left.width.equalTo(showImage!)
            make.top.equalTo(showImage!.snp.bottom).offset(38)
            make.height.equalTo(12)
        })
                
        firstTitle = UILabel()
        firstTitle?.font = UIFont.systemFont(ofSize: 18)
        firstTitle?.textAlignment = NSTextAlignment.center
        firstTitle?.textColor = UIColor.blue
        self.contentView.addSubview(firstTitle!)
        firstTitle?.snp.makeConstraints({ (make) in
            make.top.equalTo(subTitle!.snp.bottom).offset(38)
            make.left.equalTo(subTitle!)
            make.height.equalTo(30)
        })
        
    }

    open func setValueForCell(dic: NSDictionary) {
        subTitle!.text = "45道菜谱"
        firstTitle!.text = "世界各地大排档的招牌美食"
        showImage!.image = UIImage(named: "coder")
    }
    open func setValueForCell() {
        subTitle!.text = "45道菜谱"
        firstTitle!.text = "世界各地大排档的招牌美食"
        showImage!.image = UIImage(named: "coder")
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
