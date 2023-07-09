//
//  QuickHelpViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/09.
//

import UIKit


/// 퀵 헬프에 대해 연습해볼 뷰 컨트롤러
///
///
///
/// 1. introduce 함수를 이용한 자기소개
/// 2. 퀵 헬프 설명
///     1. summary
///     2. Parameters
///     3. Returns
///
/// 백틱(₩) 세 개를 사용하여 코드 작성 가능
///
/// ```
///var introduction : String = ' '   // 코드 및 주석 작성 가능
///```
class QuickHelpViewController: UIViewController {

    
    /// 이 함수는 자기 소개에 대한 함수입니다
    /// 한 칸 띄우지 않고 바로 쓰면  위 문장이랑 이어짐 (첫 문장은 Summary)
    ///
    /// 띄어쓰려면 한 칸 비우고 작성하면 Discussion에 작성됨
    ///
    ///
    /// - Parameters:
    ///   - name: 자신의 이름을 받는 파라미터
    ///   - age: 자신의 나이를 받는 파라미터
    /// - Returns: 이름과 나이를 소개하는 String 타입 문장 리턴
    func introduce(name : String, age : Int) -> String {
        
        print(name, age)
        var introduction = "안녕하세요 저는 \(name)입니다. 제 나이는 \(age)입니다."
        return introduction
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a = introduce(name: "as", age: 1)

        
    }
    

   

}
