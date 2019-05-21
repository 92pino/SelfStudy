//
//  ViewController.swift
//  InstagramPractice
//
//  Created by JinBae Jeong on 17/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
    }
    
    func configure() {
        naviSetting()
    }
    
    func naviSetting() {
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
    }
    
    func autoLayout() {
        
    }
    
    @objc func cameraButtonDidTap(_ sender : UIButton) {
        
    }


}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let vc = AddFeedViewController()
        
        vc.image = info[.originalImage] as? UIImage
        
        navigationController?.pushViewController(vc, animated: true)
        picker.dismiss(animated: true, completion: nil)
    }
    
}
