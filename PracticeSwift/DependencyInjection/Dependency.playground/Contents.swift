import UIKit

// 의존성이 있는 프로토콜
protocol Talk {
    
    var saying : String {get set}
    func sayHi()
}


// Talk 프로토콜을 채택하여 구현(준수)한 클래스
class FriendTalk : Talk{
    
    var saying : String = "FriendTalk 입니다."
    
    func sayHi() {
        print("FriendTalk - sayHi()")
    }
}


// Talk 프로토콜을 채택하여 구현(준수)한 클래스
class ParentsTalk : Talk{
    
    var saying : String = "ParentsTalk 입니다."
    
    func sayHi() {
        print("ParentsTalk - sayHi()")
    }
}


// 의존성을 주입 받은 클래스
class LetsTalk{
    var talkProvider : Talk
    
    var saying : String{
        talkProvider.saying
    }
    
    init(talk : Talk){
        self.talkProvider = talk
    }
    
    func sayHi(){
        talkProvider.sayHi()
    }
}


let letsTalk = LetsTalk(talk: FriendTalk())
letsTalk.sayHi()
print(letsTalk.saying)

print("===================")

let letsTalk2 = LetsTalk(talk: ParentsTalk())
letsTalk2.sayHi()
print(letsTalk2.saying)

