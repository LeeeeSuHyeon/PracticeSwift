import UIKit

// 프로토콜은 약속
// 이름 설정은 **delegate, **able, **ing 등으로 설정
protocol Naming {
    
    // 우리는 이런 변수와 메서드를 가지고 있을 것입니다. 라고 약속하는 것
    var name : String { get set}
    
    func getName() -> String
}

// 프로토콜 확장 (기본 구현)
extension Naming{
    func getName() -> String {
        return "제 이름은 \(self.name)입니다."
    }
}

//struct Person : Naming{
//    var name: String
//}
//var person = Person(name: "홍길동")
//print(person.getName()) // 출력 : 제 이름은 홍길동 입니다.


// 프로토콜 확장 (새로운 기능 추가)
extension Naming{
    func address() -> String{
        return "저는 경기도에 살고 있습니다."
    }
}

struct Person : Naming{
    var name: String
}
var person = Person(name: "홍길동")
print(person.address())     // 저는 경기도에 살고 있습니다.





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



// 프로토콜 상속
struct Friend : Naming {
    var name: String
    
    func getName() -> String {
        "제 친구 이름은 \(self.name)"
    }
}

var myFriend = Friend(name: "홍길동")

print(myFriend.getName())

