//
//  AlertViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/01.
//

import UIKit

class AlertViewController: UIViewController {

    // blue 버튼 action
    @IBAction func blueButton(_ sender: Any) {
        
        // alert 스타일 사용
        let alert = UIAlertController(title: "배경화면 색 전환", message: "버튼 색으로 배경을 바꾸시겠습니까?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default){action in
            self.view.backgroundColor = UIColor.blue
            
        }
        alert.addAction(okAction)
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func actionSheetButton(_ sender: UIButton) {
        
        // actionSheet 스타일 사용
        let alert = UIAlertController(title: "배경화면 색 전환", message: "버튼 색으로 배경을 바꾸시겠습니까?", preferredStyle: .actionSheet)
        
        let green = UIAlertAction(title: "green", style: .default){ action in
            self.view.backgroundColor = UIColor.green
        }
        
        let white = UIAlertAction(title: "white", style: .default){ action in
            self.view.backgroundColor = UIColor.white
        }
        
        let red = UIAlertAction(title: "red", style: .default){ action in
            self.view.backgroundColor = UIColor.red
        }
        
        alert.addAction(green)
        alert.addAction(white)
        alert.addAction(red)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    



}
