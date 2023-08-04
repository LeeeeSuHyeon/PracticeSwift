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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 이미지뷰의 cornerRadius 설정
        self.profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        self.profileImageView.contentMode = .scaleAspectFill

        
    }
    

    
}


extension UseControllerPictureViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 버튼 액션
    @IBAction func changeProfileBtn(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary  // 앨범 설정
        imagePicker.mediaTypes = ["public.image", "public.movie"]   // 카메라 설정
        present(imagePicker, animated: true)
    }
    
    
    // 이미지 선택 완료 시 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택한 이미지 가져오기
        if let selectedImage = info[.originalImage] as? UIImage {
            // 이미지뷰에 선택한 이미지 설정
            profileImageView.image = selectedImage
        }
        
        // 화면 dismiss
        dismiss(animated: true)
    }
}
