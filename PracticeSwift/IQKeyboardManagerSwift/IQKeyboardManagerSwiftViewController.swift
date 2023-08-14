//
//  IQKeyboardManagerSwiftViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/14.
//

import UIKit
import IQKeyboardManagerSwift

class IQKeyboardManagerSwiftViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 키보드 매니저 활성화
        IQKeyboardManager.shared.enable = true
        
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.toolbarTintColor = .black
        IQKeyboardManager.shared.toolbarBarTintColor = .white
        
    }
    



}
