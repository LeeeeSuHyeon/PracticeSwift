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
        btnAction()
        

    }
    
    // 이미지 선택 완료 시 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // 이미지뷰에 선택한 이미지 설정
            imageView.image = selectedImage
        }
        
        // 이미지 피커 닫기
        picker.dismiss(animated: true, completion: nil)


    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}


extension UseControllerPictureViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    fun btnAction(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.mediaTypes = ["public.image"]
        present(imagePicker, animated: true, completion: nil)
    }
}
