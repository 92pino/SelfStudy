//
//  TestCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by JinBae Jeong on 21/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    var bountyInfo: BountyInfo?
    
    var imgView: UIImageView = UIImageView()
    var shopLabel: UILabel = UILabel()
    var textLabel: UILabel = UILabel()
    var bountyLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        contentView.addSubview(imgView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: imgView.centerYAnchor),
            ])
        self.textLabel = textLabel
        self.reset()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func reset() {
        self.textLabel.textAlignment = .center
    }

    func updateUI(_ bountyInfo: BountyInfo) {
        let img = UIImage(named: "\(bountyInfo.name).jpg")
        print(img)
        imgView.image = img!
        shopLabel.text = bountyInfo.name
        bountyLabel.text = "\(bountyInfo.bounty)"
    }
    
}
