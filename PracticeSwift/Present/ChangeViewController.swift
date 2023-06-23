//
//  ChangeViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/22.
//

import UIKit

class ChangeViewController: UIViewController {

    
    @IBAction func otherViewButton(_ sender: UIButton) {
        
        let otherVC = storyboard?.instantiateViewController(withIdentifier: "OtherViewController")
        otherVC?.modalPresentationStyle = .fullScreen   // full screen 띄우기
        otherVC?.modalTransitionStyle = .coverVertical  // 화면 띄우는 방식
        present(otherVC!, animated: true, completion: nil)  // completion : nil은 디폴트 값이기 때문에 작성하지 않아도 됨
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
