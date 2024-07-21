//
//  CombineViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/19/24.
//

import UIKit
import Combine

class CombineViewController : ViewController {
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCheckPassword: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    var viewModel : CombineViewModel!
    
    private var mySubscription = Set<AnyCancellable>() // 메모리 관리를 위해 사용
    
    override func viewDidLoad() {
        
        viewModel = CombineViewModel()
        
        // 뷰모델에서 뷰컨트롤러의 텍스트 필드를 구독
        txtPassword
            .myPublisher
            .receive(on: DispatchQueue.main)           // 스레드 - 메인에서 받겠다
            .assign(to: \.password, on: viewModel)     // 구독
            .store(in: &mySubscription)                 // 메모리 관리
        
        txtCheckPassword
            .myPublisher
            .receive(on: DispatchQueue.main)           // 스레드 - 메인에서 받겠다
            .assign(to: \.checkPassword, on: viewModel)     // 구독
            .store(in: &mySubscription)                 // 메모리 관리
        
        // 뷰컨트롤러에서 뷰모델의 프로퍼티를 구독
        viewModel.isMatchPasswrod
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: btn)
            .store(in: &mySubscription)
    }
}

extension UITextField {
    var myPublisher : AnyPublisher<String, Never>{
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap{$0.object as? UITextField}  // Notification에서 UITextField만 가져옴
            .map{$0.text ?? ""}     // TextField의 text만 가져옴
            .print()
            .eraseToAnyPublisher()  // 모든 Publisher를 AnyPublisher로 변환
    }
}

extension UIButton {
    var isValid : Bool {
        get {
            backgroundColor == .yellow
        }
        set {
            backgroundColor = newValue ? .yellow : .lightGray
            isEnabled = newValue
            setTitleColor(newValue ? .blue : .white, for: .normal)
            
        }
    }
}
