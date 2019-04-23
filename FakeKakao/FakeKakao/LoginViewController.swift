//
//  ViewController.swift
//  FakeKakao
//
//  Created by JinBae Jeong on 17/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logo = UIImageView()
    let loginView = UIView()
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton(type: .system)
    let loginButton = UIButton(type: .system)
    
    var userModel: UserModel = UserModel()
    var slidingUpViewForEmailPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setFrame()
        autoLayout()
    
    }
    
    func setFrame(){
        logo.image = UIImage(named: "logo")
        
        buttonEvent()
        textFieldSet()
        
        view.addSubview(logo)
        view.addSubview(loginView)
        view.addSubview(loginButton)
    }
    
    func textFieldSet(){
        idTextField.placeholder = "아이디를 입력해주세요"
        idTextField.text = ""
        idTextField.clearButtonMode = .whileEditing
        idTextField.borderStyle = .roundedRect
        idTextField.layer.cornerRadius = 15
        idTextField.keyboardType = UIKeyboardType.emailAddress
        // MARK: - 키보드 색상 어두운걸로 적용
        idTextField.keyboardAppearance = UIKeyboardAppearance.dark
        // MARK: - 문자를 입력하지 않았을때 리턴키 비활성화 적용
        idTextField.enablesReturnKeyAutomatically = true
        
        passwordTextField.placeholder = "비밀번호를 입력해주세요"
        passwordTextField.text = ""
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardAppearance = UIKeyboardAppearance.dark
        passwordTextField.enablesReturnKeyAutomatically = true
        
        loginView.addSubview(idTextField)
        loginView.addSubview(passwordTextField)
        
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self

    }
    
    func goToSignUp(){
        
    }
    
    func buttonEvent(){
        loginButton.backgroundColor = #colorLiteral(red: 0.358830452, green: 0.3251366019, blue: 0.7960427403, alpha: 1)
        loginButton.setTitle("로그인버튼", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginChk), for: .touchUpInside)
    }
    
    @objc func loginChk(){
        guard let id = idTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        let isLoginSuccess: Bool = userModel.findUser(inputID: id, inputPassword: password)
        
        if isLoginSuccess == true {
            
            let alertController = UIAlertController(title: "로그인 성공", message: "Welcome!!!", preferredStyle: .alert)
            let tabBarViewController = TabBarViewController()
            
            let okAction = UIAlertAction(title: "확인", style: .destructive, handler: { [weak self] (alert) in
                print("버튼이 눌림")
                print(tabBarViewController)
                self?.present(tabBarViewController, animated: true)
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            
            
            print("로그인 성공")
        } else {
            //실패시 애니메이션효과
            UIView.animate(withDuration: 0.15, animations: {
                self.idTextField.frame.origin.x -= 10
                self.passwordTextField.frame.origin.x -= 10
                self.idTextField.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                self.passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            }, completion: { _ in
                UIView.animate(withDuration: 0.15, animations: {
                    self.idTextField.frame.origin.x += 20
                    self.passwordTextField.frame.origin.x += 20
                }, completion: { _ in
                    UIView.animate(withDuration: 0.15, animations: {
                        self.idTextField.frame.origin.x -= 10
                        self.passwordTextField.frame.origin.x -= 10
                        self.idTextField.backgroundColor = UIColor.white
                        self.passwordTextField.backgroundColor = UIColor.white
                    })
                })
            })
        }
    }
    
    var loginViewPriority: NSLayoutConstraint?
    
    // 유저 정보 체크

    func autoLayout(){
        
        let guide = self.view.safeAreaLayoutGuide
        
        // 로고 이미지 뷰
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        //logo.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30).isActive = true
        logo.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        //logo.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 50).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        // 버튼
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        //loginButton.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 50).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -50).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // 로그인 뷰
        loginView.translatesAutoresizingMaskIntoConstraints = false
//        loginView.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 50).isActive = true
        loginView.bottomAnchor.constraint(equalTo: loginButton.topAnchor,constant: -50).isActive = true
        loginView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30).isActive = true
        loginView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //textField autoLayout
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 20).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -10).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 10).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 50)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50)
    }
 
    
    


}

extension LoginViewController: UITextFieldDelegate {
    // MARK: - 텍스트 필드의 편집이 시작된 후 호출 method
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("택스트 필드의 편집이 시작되었습니다.")
        
        // MARK: - 뷰위치 위로 이동 구현
        guard slidingUpViewForEmailPassword == false else { return }
        UIView.animate(withDuration: 0.3) {
            loginView.
            self.slidingUpViewForEmailPassword = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        
        // MARK: - 뷰위치 아래로 이동 구현
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y += 350
        }
        slidingUpViewForEmailPassword = false
        return true
    }

}
