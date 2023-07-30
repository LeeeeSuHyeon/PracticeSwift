//
//  UseControllerPictureViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/30.
//

import UIKit

class UseControllerPictureViewController: UIViewController {

    @IBOutlet weak var changeProfileBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    // 버튼 액션 
    @IBAction func changeProfileBtn(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}


extension UseControllerPictureViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
