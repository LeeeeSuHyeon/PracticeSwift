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
        
        bottomButton.snp.makeConstraints{ make in
            make.left.equalTo(baseView.snp.left)
            make.right.equalTo(baseView.snp.right)
            make.bottom.equalTo(baseView.snp.bottom)
            make.size.height.equalTo(50)
            
        }
        
        bottomBaseView.snp.makeConstraints{ make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.view)
        }
            
    }
}
