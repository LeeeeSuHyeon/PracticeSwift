//
//  UserProfileViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/02.
//

import UIKit

// 뷰 (View)
class UserProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var user = User(name: "홍길동", age: 24)
    var viewModel : UserViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = UserViewModel(user: user)

        updateUI()
    }
    
    func updateUI(){
        nameLabel.text = viewModel.name
        ageLabel.text = viewModel.age
    }

}
