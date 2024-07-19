//
//  CombineViewModel.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/19/24.
//

import Foundation
import Combine

class CombineViewModel {
    @Published var password = ""
    @Published var checkPassword = ""
    
    lazy var isMatchPasswrod : AnyPublisher<Bool, Never> = Publishers
        .CombineLatest($password, $checkPassword)
        .map({ (password : String, checkPassword : String) in
            if password == "" || checkPassword == "" {
                return false
            }
            else if password == checkPassword {
                return true
            }
            else {
                return false
            }
        })
        .print()
        .eraseToAnyPublisher()
}
