//
//  CustomTableViewCell.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 08/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  let title = UILabel()
  let desc = UILabel()
  let opendate = UILabel()
  let rating = UILabel()
  let thumbnail = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
    autoLayout()
  }
  
  func configure(){
    title.tag = 101
    desc.tag = 102
    opendate.tag = 103
    rating.tag = 104
  }
  
  func autoLayout(){
    contentView.addSubview(title)
    contentView.addSubview(desc)
    contentView.addSubview(opendate)
    contentView.addSubview(rating)
    contentView.addSubview(thumbnail)
    
    thumbnail.translatesAutoresizingMaskIntoConstraints = false
    
    thumbnail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
    thumbnail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    thumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    thumbnail.widthAnchor.constraint(equalToConstant: 55).isActive = true
    
    title.translatesAutoresizingMaskIntoConstraints = false
    
    title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
    title.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 10).isActive = true
    title.widthAnchor.constraint(equalToConstant: 150).isActive = true
    title.heightAnchor.constraint(equalToConstant: 21).isActive = true
    title.font = UIFont.systemFont(ofSize: 20)
    
    opendate.translatesAutoresizingMaskIntoConstraints = false
    
    opendate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
    opendate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    opendate.widthAnchor.constraint(equalToConstant: 100).isActive = true
    opendate.heightAnchor.constraint(equalToConstant: 21).isActive = true
    opendate.textAlignment = .right
    
    desc.translatesAutoresizingMaskIntoConstraints = false
    
    desc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    desc.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 10).isActive = true
    desc.widthAnchor.constraint(equalToConstant: 200).isActive = true
    desc.heightAnchor.constraint(equalToConstant: 21).isActive = true
    desc.font = UIFont.systemFont(ofSize: 16)
    
    rating.translatesAutoresizingMaskIntoConstraints = false
    
    rating.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    rating.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    rating.widthAnchor.constraint(equalToConstant: 50).isActive = true
    rating.heightAnchor.constraint(equalToConstant: 21).isActive = true
    rating.textAlignment = .right
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    
    fatalError("init(coder:) has not been implemented")
  }
}
