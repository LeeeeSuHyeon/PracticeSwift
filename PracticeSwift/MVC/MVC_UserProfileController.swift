//
//  UserProfileController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/02.
//

import Foundation

// 컨트롤러(Controller)
class MVC_UserProfileController {
    let user: MVC_User
    let userProfileView : MVC_UserProfileViewController
    
    init(user: MVC_User, view: MVC_UserProfileViewController) {
        self.user = user
        self.userProfileView = view
    }
    
    func updateUserProfile(){
        userProfileView.nameLabel.text = user.name
        userProfileView.ageLabel.text = "\(user.age)"
    }
    
}

