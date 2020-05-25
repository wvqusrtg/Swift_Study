//
//  MomentTableViewCell.swift
//  InterviewSwift
//
//  Created by ai-nixs on 2020/5/7.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import SnapKit

class MomentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //懒加载控件
    lazy var usernameLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var contentLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        //设置高度自动适配
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
        
    func snpLayoutSubview(){
        self.contentView.addSubview(usernameLabel)
        self.contentView.addSubview(contentLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            //关键代码，最后一个子视图必须设置bottom.equalTo，不然无法自动计算高度
            make.bottom.equalTo(-10)
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        snpLayoutSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier = "MomentTableViewCell"
    static func dequeueReusable(with tableView:UITableView) -> MomentTableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if let cell = reusableCell as? MomentTableViewCell {
            return cell
        }else{
            return MomentTableViewCell.init(style: .default, reuseIdentifier: MomentTableViewCell.identifier)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
