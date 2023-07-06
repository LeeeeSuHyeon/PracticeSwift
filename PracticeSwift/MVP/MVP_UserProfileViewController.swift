//
//  MVP_UserProfileViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/05.
//

import UIKit

class MVP_UserProfileViewController: UIViewController, MVP_UserProfileView {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    private var presenter: MVP_UserProfilePresenter!

       override func viewDidLoad() {
           super.viewDidLoad()

           let user = MVP_User(name: "MVP길동", age: 24)
           presenter = MVP_UserProfilePresenter(user: user, view: self)
           presenter.updateUserProfile()
       }

       func showUserName(_ name: String) {
           nameLabel.text = name
       }

       func showUserAge(_ age: Int) {
           ageLabel.text = "\(age)"
       }
   }
