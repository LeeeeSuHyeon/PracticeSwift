//
//  OptionalViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/28.
//

import UIKit

class OptionalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     

//        var optionalValue : Int? = 10
//
//
//
//
//        struct data {
//            var someProperty : Int
//        }
//
//        var optionalValue1 : data?
//
//        // optionalValue가 nil이라면 result는 nil이 됨
//        let result = optionalValue1?.someProperty
//
//
//        // 옵셔널 값이 nil이 아니라고 가정하고 강제 언래핑하여 unwrappedValue에 할당
//        let unwrappedValue = optionalValue!
//
//
//        if let unwrappedValue = optionalValue {
//            // 값이 있다면 unwrappedValue를 사용하여 작업 수행
//        } else {
//            // 값이 없는 경우 처리
//        }
//
//
//        // optionalValue가 nil인 경우 함수 종료, nil이 아닌 경우 이후 작업 실행
//        guard let unwrappedValue = optionalValue else {return}
//        print(unwrappedValue)
//
        
        
        // 옵셔널 값이 nil인 경우 '??' 우측에 제공한 기본 값 사용
        let optionalValue: Int? = nil
        let unwrappedValue = optionalValue ?? 10
        print(unwrappedValue) // 출력: 10

        
        // 옵셔널 값이 nil이 아닌 경우 옵셔널 값 그대로 사용
        let optionalValue1: Int? = 20
        let unwrappedValue1 = optionalValue1 ?? 10
        print(unwrappedValue) // 출력: 20

        
        
    }
    



}
