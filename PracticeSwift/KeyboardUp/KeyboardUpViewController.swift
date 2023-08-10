//
//  KeyboardUpViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/10.
//

import UIKit

class KeyboardUpViewController: UIViewController {
    
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
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "아이디 설정"
        view.backgroundColor = .white
        
        view.addSubview(baseView)
        baseView.addSubview(titleLb)
        baseView.addSubview(textfield)
        baseView.addSubview(bottomButton)
        view.addSubview(bottomBaseView)
    }
    


}
