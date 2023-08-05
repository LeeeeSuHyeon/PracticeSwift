import UIKit

// 프로토콜은 약속
// 이름 설정은 **delegate, **able, **ing 등으로 설정
protocol Naming {
    
    // 우리는 이런 변수와 메서드를 가지고 있을 것입니다. 라고 약속하는 것
    var name : String { get set}
    
    func getName() -> String
}

protocol Aging {
    var age : Int { get set}
}

protocol UserInformation : Naming, Aging{
    
}


class MyBestFriend : UserInformation{
    var name: String = ""
    
    func getName() -> String {
        "나의 bestFreind는 \(self.name)"
    }
    
    var age: Int = 22

}




struct Friend : Naming {
    var name: String
    
    func getName() -> String {
        "제 친구 이름은 \(self.name)"
    }
}

var myFriend = Friend(name: "홍길동")

print(myFriend.getName())

