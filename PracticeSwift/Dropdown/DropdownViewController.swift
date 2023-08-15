//
//  DropdownViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/15.
//

import UIKit
import DropDown

class DropdownViewController: UIViewController {
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dropDownBtn: UIButton!
    
    
    @IBAction func dropDownBtn(_ sender: UIButton) {
        dropDownSet()
        
    }
    // 객체 생성
    let dropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    func dropDownSet() {
        
        // 드롭다운 데이터소스 추가
        dropDown.dataSource = ["홍길동", "김길동", "이길동", "최길동", "박길동"]
        
        // 드롭다운 위치를 dropDwonBtn으로 설정
        dropDown.anchorView = dropDownBtn
        
        // 드롭다운을 버튼 바로 아래로 위치 조정
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        
        // 가로 길이 설정
        dropDown.width = 100
        
        // 높이 설정
        dropDown.cellHeight = 50
        
        // 글자색 변경
        dropDown.textColor = .blue
        
        // 선택된 메뉴 글씨 색깔 변경
        dropDown.selectedTextColor = .red
        
        // 폰트 사이즈 변경
        dropDown.textFont = UIFont.systemFont(ofSize: 20)
        
        // 배경색 변경
        dropDown.backgroundColor = .green
        
        // 선택된 메뉴 배경색 변경
        dropDown.selectionBackgroundColor = .yellow
        
        // 모서리 둥글게 변경
        dropDown.cornerRadius = 10
        
        // 선택한 값 가져오기
        dropDown.selectionAction = { [unowned self] (index : Int, item : String) in
            label.text = "선택한 아이템 : \(item)"
            indexLabel.text = "선택한 인덱스 : \(index)"
            
        }
        
        // 드롭다운 활성화
        dropDown.show()
    }

}
