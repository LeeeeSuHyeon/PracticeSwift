import UIKit

//class Friend {
//    var name : String
//
//    // class의 프로퍼티의 name 값을 변경하는 메서드
//    func changeName(newName : String){
//        self.name = newName
//    }
//
//    init(_ name : String){
//        self.name = name
//    }
//}
//
//var myFriend = Friend("홍길동")
//myFriend.changeName(newName: "김길동")
//print(myFriend.name)    // 김길동


struct Friend {
    var name : String
    
    // class의 프로퍼티의 name 값을 변경하는 메서드
    mutating func changeName(newName : String){
        self.name = newName
    }
}

var myFriend = Friend(name: "홍길동")
myFriend.changeName(newName: "김길동")
print(myFriend.name)    // 김길동
