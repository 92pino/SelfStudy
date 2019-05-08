//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by JinBae Jeong on 08/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imgView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func pick(_ sender: UIButton) {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary // 소스타입을 사진 라이브러리로 선택
    picker.allowsEditing = true       // 이미지 편집 기능 On
    
    // 추가된 부분) 델리게이트 지정
     picker.delegate = self
    
    // 이미지 피커 컨트롤러 실행
    self.present(picker, animated: true)
  }
  
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
    
    let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .cancel))
    self.present(alert, animated: true)
  }
  
  // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true) { () in
      let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
      self.imgView.image = img
    }
  }
}
