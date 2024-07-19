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
        
        txtPassword
            .myPublisher
            .print()
            .receive(on: DispatchQueue.main)           // 스레드 - 메인에서 받겠다
            .assign(to: \.password, on: viewModel)     // 구독
            .store(in: &mySubscription)                 // 메모리 관리
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
