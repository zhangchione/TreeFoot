//
//  MineBodyTableViewCell.swift
//  TreeFoot
//
//  Created by zhangchi on 2020/9/16.
//  Copyright © 2020 Hut. All rights reserved.
//

import UIKit

class MineBodyTableViewCell: UITableViewCell {

    
    
    public func updateUI(with data: MineModel) {
        self.leftIcon.image = UIImage(named: data.leftIcon)
        self.titleLabel.text = data.titleText
    }
    
    
    lazy var leftIcon:UIImageView = {
        let img = UIImageView()
         img.image = UIImage(named: "mine_icon_setright")
         return img
     }()
    
    // 用户名
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.fit)
        label.text = "本周食谱"
        label.textColor = UIColor.black
        return label
    }()
    
    
    lazy var rightIcon:UIImageView = {
        let img = UIImageView()
         img.image = UIImage(named: "mine_icon_setright")
         return img
     }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        addSubview(leftIcon)
        leftIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(20.fit)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(20.fit)
            make.width.equalTo(15.fit)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(80.fit)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(30.fit)
            make.width.equalTo(100.fit)
        }
        addSubview(rightIcon)
        rightIcon.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-30.fit)
             make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(20.fit)
            make.width.equalTo(15.fit)
        }
    }

}