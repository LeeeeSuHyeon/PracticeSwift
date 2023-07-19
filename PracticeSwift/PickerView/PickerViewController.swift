//
//  PickerViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/16.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectedList: UILabel!
    
    
    let pickerViewCount = 5     // pickerView의 Lable 개수
    let pickerViewColumn = 1    // pickerView의 열 개수
    
    let pickerViewHeight : CGFloat = 60     // pickerView 높이 설정
    
    // pickerView에 띄울 내용
    var pickerViewList = ["홍길동", "이길동", "김길동", "최길동", "박길동"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedList.text = "선택된 리스트"
        
        pickerView.dataSource = self
        pickerView.delegate = self

    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // return 1    // 하나의 컴포넌트(열) 사용
        return pickerViewColumn
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // return pickerViewList.count
        return pickerViewCount

    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewList[row] // pickerViewList 배열의 요소를 각 행에 표시
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedOption = pickerViewList[row]
        
        self.selectedList.text = selectedOption
        print("Selected option: \(selectedOption)")
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerViewHeight
    }

    

    
}


