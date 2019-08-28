//
//  TableView2Cell.swift
//  snapKitExample
//
//  Created by JinBae Jeong on 2019/08/24.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class TableView2Cell: UITableViewCell {

    let userImage: UIImageView = {
        let imgView = UIImageView()
        
        return imgView
    }()
    
    var userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .red
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func bind(model: TableView2Model) {
        self.userName.text = model.name
        self.userImage.kf.setImage(with: URL(string: model.imageUrl!))
    }

}

extension TableView2Cell {
    func setupUI() {
        self.accessoryType = .disclosureIndicator
        
        self.addSubview(self.userImage)
        self.addSubview(self.userName)
        
        userImage.snp.makeConstraints{
            $0.left.equalTo(contentView.snp.left).offset(10)
            $0.top.equalTo(10)
            $0.bottom.equalTo(-10)
            $0.width.equalTo(userImage.snp.height)
        }
        
        userName.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.equalTo(contentView.snp.right)
            $0.left.equalTo(userImage.snp.right).offset(10)
            $0.height.equalTo(21)
        }
    }
}
