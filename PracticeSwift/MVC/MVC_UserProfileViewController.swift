//
//  MVC_UserProfileViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/02.
//

import UIKit


// 뷰 (View)
class MVC_UserProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    
    
    override func viewDidLoad() {
        
        let user = MVC_User(name: "이길동", age: 28)
        let userProfileController = MVC_UserProfileController(user: user, view: self)
        
        userProfileController.updateUserProfile()
    }
}


