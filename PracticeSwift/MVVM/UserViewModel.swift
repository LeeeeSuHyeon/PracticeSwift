//
//  UserViewModel.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/02.
//

import Foundation


// 뷰모델 (ViewModel)
class UserViewModel {
    private var user : User
    
    init(user: User){
        self.user = user
    }
    
    var name : String{
        return user.name
    }
    
    var age: String{
        return "\(user.age)"
    }
}
