//
//  KeyboardUpViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/10.
//

import UIKit

class KeyboardUpViewController: UIViewController {
    
    // 키보드 올라올 때 bottomButton의 bottomAnchor 설정을 위해 사용
    var bottomButtonConstraint : NSLayoutConstraint?
    
    lazy var baseView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var titleLb : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이디 입력"
        
        return label
    }()
    
    lazy var textfield : UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "아이디를 입력해주세요. "
        
        
        return view
    }()
    
    lazy var bottomButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    lazy var bottomBaseView : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "아이디 설정"
//        view.backgroundColor = .red
        
        view.addSubview(baseView)
        baseView.addSubview(titleLb)
        baseView.addSubview(textfield)
        baseView.addSubview(bottomButton)
        view.addSubview(bottomBaseView)
        
        applyConstraints()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardNotifications()
    }
    
    
    
    // notification 추가하는 메서드
    func addKeyboardNotifications(){
        
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // notification 제거하는 메서드
    func removeKeyboardNotifications(){
        
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name:
                                                    
                                                    UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    
    // 키보드가 나타날 때 코드
    @objc func keyboardWillShow(_ noti : NSNotification){
        
        // 키보드의 높이만큼 화면을 올려줌
        if let keyboardFrame : NSValue = noti.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            // bottomBaseView의 높이를 올려줌
            // 노치 디자인인 경우 safe area를 계산함
            if #available(iOS 11.0, *){
                let bottomInset = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets.bottom ?? 0
                let adjustedKeyboardHeight = keyboardHeight - bottomInset
                
                
                //bottomBaseView의 높이를 올림
                bottomButtonConstraint?.constant = -adjustedKeyboardHeight
            } else {
                
                // 노치 디자인이 없는 경우에는 원래대로 계산
                bottomButtonConstraint?.constant = -keyboardHeight
            }
            view.layoutIfNeeded()
        }
        
    }
    
    // 키보드가 사라졌을 때 코드
    @objc func keyboardWillHide(_ noti : NSNotification){
        
        // 키보드의 높이만큼 화면을 내려줌
        bottomButtonConstraint?.constant = 0
        view.layoutIfNeeded()
        
    }
    
    
    // 화면 터치하면 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    // constarints 설정
    fileprivate func applyConstraints(){
        let baseViewConstraints = [
            baseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            baseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let titleLbConstraints = [
            titleLb.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 30),
            titleLb.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 30)
        ]
        
        let textfieldConstraints = [
            textfield.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 30),
            textfield.topAnchor.constraint(equalTo: titleLb.bottomAnchor, constant: 20)
        ]
        
        let bottomButtonConstraints = [
            bottomButton.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        bottomButtonConstraint = bottomButton.bottomAnchor.constraint(equalTo: baseView.bottomAnchor)
        bottomButtonConstraint?.isActive = true
        
        let bottomBaseViewContraints = [
            bottomBaseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomBaseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomBaseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomBaseView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(baseViewConstraints)
        NSLayoutConstraint.activate(titleLbConstraints)
        NSLayoutConstraint.activate(textfieldConstraints)
        NSLayoutConstraint.activate(bottomButtonConstraints)
        NSLayoutConstraint.activate(bottomBaseViewContraints)
    }
}


