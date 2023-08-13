//
//  KeyboardUpSnapKitViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/12.
//

import UIKit
import SnapKit

class KeyboardUpSnapKitViewController: UIViewController {
    
    
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

        view.addSubview(baseView)
        baseView.addSubview(titleLb)
        baseView.addSubview(textfield)
        baseView.addSubview(bottomButton)
        view.addSubview(bottomBaseView)
        
        
        useSnapKit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardNotification()
    }
    


    func useSnapKit(){
        
        baseView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        titleLb.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(30)
            make.top.equalTo(baseView.snp.top).offset(30)
            
        }
        
        textfield.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(30)
            make.top.equalTo(titleLb.snp.bottom).offset(20)
        }
        
        bottomButtonConstraint = bottomButton.bottomAnchor.constraint(equalTo: baseView.bottomAnchor)
        bottomButtonConstraint?.isActive = true
        
        bottomButton.snp.makeConstraints{ make in
            make.left.equalTo(baseView.snp.left)
            make.right.equalTo(baseView.snp.right)
//            make.bottom.equalTo(baseView.snp.bottom)
            make.size.height.equalTo(50)
            
        }
        
        bottomBaseView.snp.makeConstraints{ make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.view)
        }
        
    }
    
    func addKeyboardNotification(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti : NSNotification){
        // 키보드의 높이만큼 화면을 올려줌
            if let keyboardFrame : NSValue = noti.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                    
                // bottomBaseView의 높이를 올려줌
                // 노치 디자인인 경우 safe area를 계산함
                if #available(iOS 11.0, *){
                    let bottomInset = UIApplication.shared.windows.first(where: { $0.isKeyWindow})?.safeAreaInsets.bottom ?? 0
                    let adjustedKeyboardHeight = keyboardHeight - bottomInset
                        
                        
                    //bottomBaseView의 높이를 올림
                    bottomButtonConstraint?.constant = -adjustedKeyboardHeight
                    
                }
                else {
                    // 노치 디자인이 없는 경우에는 원래대로 계산
                    bottomButtonConstraint?.constant = -keyboardHeight
                }
                // 화면 업데이트
                view.layoutIfNeeded()
            }
    }
    
    @objc func keyboardWillHide(_ noti : NSNotification){
        
        bottomButtonConstraint?.constant = 0
        view.layoutIfNeeded()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
