//
//  ViewController.swift
//  ImagePickerControllerPractice
//
//  Created by JinBae Jeong on 09/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let containView = UIView()
  let album = UIButton()
  let camera = UIButton()
  let imageView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    configure()
  }
  
  func configure(){
    view.addSubview(containView)
    containView.addSubview(album)
    containView.addSubview(camera)
    view.addSubview(imageView)
    
    autoLayout()
    setButton()
  }
  
  
  func setButton(){
    album.setTitle("Album", for: .normal)
    camera.setTitle("Camera", for: .normal)
    
    
  }
  
  func autoLayout(){
    containView.translatesAutoresizingMaskIntoConstraints = false
    containView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    containView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    containView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: containView.bottomAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }


}

