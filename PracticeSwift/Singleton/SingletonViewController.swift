//
//  SingletonViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/08.
//

import UIKit

class SingletonViewController: UIViewController {

    // Pet 클래스 정의, final : 상속 불가능
    final class Pet{
        static let shared = Pet()
        private init () {}
        
        
        var name : String = "짱아"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Pet 클래스 생성
        let myCat = Pet.shared
        let myDog = Pet.shared
        
        print("myCat : ", myCat.name)
        print("myDog : ", myDog.name)
    }
}
