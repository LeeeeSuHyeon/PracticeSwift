//
//  DependencyViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/10.
//

import UIKit

// 의존성이 있는 프로토콜
protocol Talk {
    func sayHi()
}


// Talk 프로토콜을 채택하여 구현한 클래스
class FriendTalk : Talk{
    func sayHi() {
        print("FriendTalk - sayHi()")
    }
}


// 의존성을 직접 주입 받은 클래스
class LetsTalk{
    private let talk : Talk
    
    init(talk : Talk){
        self.talk = talk
    }
    
    func sayHi(){
        talk.sayHi()
    }
}








//// 의존성을 직접 주입 받은 클래스
//class LetsTalk{
//    private let talk : Talk
//
//    init(){
//        self.talk = FriendTalk()    //FriendTalk 인스턴스를 직접 생성하여 주입
//    }
//
//    func sayHi(){
//        talk.sayHi()
//    }
//}






class DependencyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
