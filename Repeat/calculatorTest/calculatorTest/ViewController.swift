//
//  ViewController.swift
//  calculatorTest
//
//  Created by JinBae Jeong on 19/04/2019.
//  Copyright © 2019 pino. All rights reserved.
//

/***********************************************************************
 
 3개의 텍스트 필드(피연산자1, 연산자, 피연산자2)에 값을 입력받아 결과 확인 버튼을 누르면
 AlertController 를 .통해 결과를 보여주는 앱 구현하기
 피연산자는 Double 타입이고, 연산자의 종류는 4가지(+, -, *, /).
 연산자나 피연산자에 잘못된 값이 들어오면 오류 메시지를 띄워주고, 계산 결과는 소수점 3자리까지 출력할 것
 
 ***********************************************************************/

import UIKit

class ViewController: UIViewController {

    let textFieldView = UIView()
    let operLabel01 = UILabel()
    let operLabel02 = UILabel()
    let oper = UILabel()
    let textField = UITextField()
    let operTextField01 = UITextField()
    let operTextField02 = UITextField()
    let operTextField = UITextField()
    let resultButton = UIButton(type: .system)
    var msg = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bind()
    }
    
    func bind(){
        setFrame()
//        autoLayout()
        resultButtonEvt()
    }
    
    func setFrame() {
        
        operTextField.borderStyle = .line
        operTextField01.borderStyle = .line
        operTextField02.borderStyle = .line
        
//        textFieldView.backgroundColor = .red
        textFieldView.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 100)
        operLabel01.text = "피연산자1"
        operLabel01.frame = CGRect(x: 0, y: 0, width: textFieldView.frame.width / 3, height: 20)
        operLabel01.textAlignment = .center
        operLabel02.frame = CGRect(x: 260, y: 0, width: textFieldView.frame.width / 3, height: 20)
        operLabel02.textAlignment = .center
        oper.frame = CGRect(x: 130, y: 0, width: textFieldView.frame.width / 3, height: 20)
        oper.textAlignment = .center
        operLabel02.text = "피연산자2"
        oper.text = "연산자"
        operTextField.text = ""
        operTextField01.text = ""
        operTextField02.text = ""
        operTextField01.frame = CGRect(x: 0, y: 30, width: textFieldView.frame.width / 3, height: 20)
        operTextField.frame = CGRect(x: 130, y: 30, width: textFieldView.frame.width / 3, height: 20)
        operTextField02.frame = CGRect(x: 260, y: 30, width: textFieldView.frame.width / 3, height: 20)
        
        textFieldView.addSubview(operLabel01)
        textFieldView.addSubview(operLabel02)
        textFieldView.addSubview(oper)
        textFieldView.addSubview(operTextField01)
        textFieldView.addSubview(operTextField02)
        textFieldView.addSubview(operTextField)
        
        view.addSubview(textFieldView)
    }
    
    func resultButtonEvt(){
        resultButton.frame = CGRect(x: 30, y: 400, width: view.frame.width - 60, height: 40)
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.addTarget(self, action: #selector(alert), for: .touchUpInside)
        resultButton.backgroundColor = .red
        
        view.addSubview(resultButton)
    }
    
    @objc func alert(_ sender : Any){
        print(msg)
        let alertController = UIAlertController(title: "결과" , message: msg, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "확인", style: .default) { (result : UIAlertAction) -> Void in
            
            print("확인")
            
        }
        
    }
    
    func autoLayout(){
        textFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        textFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30).isActive = true
        textFieldView.heightAnchor.constraint(equalToConstant: 300)
    }
    
    func result() {
        var operChk = operTextField.text
        switch operChk {
        case "+":
            msg = String(sum(operTextField01.text!, operTextField02.text!)))
        case "-":
            print(minus(operTextField01.text!, operTextField02.text!))
        case "*":
            print(multiply(operTextField01.text!, operTextField02.text!))
        case "/":
            print(divide(operTextField01.text!, operTextField02.text!))
        default:
            return
        }
    }
    
    func sum(_ : String, _ : String) -> Double {
        return (Double(operTextField01.text!)! + Double(operTextField02.text!)!)
    }

    func minus(_ : String, _ : String) -> Double {
        return (Double(operTextField01.text!)! - Double(operTextField02.text!)!)
    }
    
    func multiply(_ : String, _ : String) -> Double {
        return (Double(operTextField01.text!)! * Double(operTextField02.text!)!)
    }
    
    func divide(_ : String, _ : String) -> Double {
        return (Double(operTextField01.text!)! / Double(operTextField02.text!)!)
    }

}

