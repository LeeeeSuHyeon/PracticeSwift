//
//  PictureViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/28.
//

import UIKit
import YPImagePicker

class PictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지뷰와 버튼의 cornerRadius 설정
        self.imageView.layer.cornerRadius = self.imageView.frame.height / 2
        self.button.layer.cornerRadius = 10
        
        // button Action 추가
        self.button.addTarget(self, action: #selector(onButtonClicked), for: .touchUpInside)
        
    }
    
    
    // button 클릭시 호출할 메서드
    @objc func onButtonClicked(){
        print("PictureViewController - onButtonClicked() called")
        
        // YPImagePickerConfiguration 인스턴스 생성
        var config = YPImagePickerConfiguration()
        
        // 화면 설정
        config.screens = [.library, .video, .photo]
        
        // YPImagePicker 인스턴스 생성
        let picker = YPImagePicker(configuration: config)
        
        // 클로저를 사용하여 이미지 선택 및 처리
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                // 이미지 선택 및 처리 로직
                // 이미지 정보 가져오기
                print(photo.fromCamera) // 이미지 소스 (카메라 또는 라이브러리)
                print(photo.image) // 사용자가 선택한 최종 이미지
                print(photo.originalImage) // 사용자가 선택한 원본 이미지 (필터가 적용되지 않은 상태)
                print(photo.modifiedImage) // 변환된 이미지, nil일 수도 있음
                print(photo.exifMeta) // 원본 이미지의 Exif 메타데이터 출력
                
                // 이미지뷰의 이미지를 photo.image로 설정 
                self.imageView.image = photo.image
            } // end of photo
            
            // picker 사라지게 하기
            picker.dismiss(animated: true, completion: nil)
            
        } // end of picker.didFinishPicking
        
        // 이미지 선택 화면 표시
        present(picker, animated: true, completion: nil)
    }
}

