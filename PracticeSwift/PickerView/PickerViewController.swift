//
//  PickerViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/16.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let pickerViewCount = 5     // pickerView의 Lable 개수
    let pickerViewColumn = 1    // pickerView의 열 개수
    
    // pickerView에 띄울 내용
    var pickerViewList = ["홍길동", "이길동", "김길동", "최길동", "박길동"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picker = UIPickerView()

    }
}


