import UIKit

//DispatchQueue.global(qos: .userInteractive) {}  // Main Queue
//DispatchQueue.global(qos: .userInitiated) {}    // 유저가 시작한 작업, 유저가 응답을 기다림
//DispatchQueue.global(qos: .default) {}          // userInitiated 와 utility 의 중간 값
//DispatchQueue.global(qos: .utility) {}          // 시간이 걸리며 즉각적인 응답이 필요하지 않은 경우
//DispatchQueue.global(qos: .background) {}       // 눈에 보이지 않는 부분의 작업. 완료 시간 중요 X
//DispatchQueue.global(qos: .unspecified) {}



//DispatchQueue.global(qos: .background).sync {
//    for item in 1...10{
//        print("sync : \(item)")
//    }
//}
//
//for item in 100...105{
//    print(item)
//}


//DispatchQueue.global(qos: .background).async {
//    for item in 1...10{
//        print("sync (1) : \(item)")
//    }
//}
//
//DispatchQueue.global(qos: .background).async {
//    for item in 50...60{
//        print("sync (2) : \(item)")
//    }
//}
//
//for item in 100...110{
//    print(item)
//}


DispatchQueue.global(qos: .userInteractive).async {
    for item in 1...10{
        print("sync (1) : \(item)")
    }
}

DispatchQueue.global(qos: .background).async {
    for item in 50...60{
        print("sync (2) : \(item)")
    }
}

for item in 100...110{
    print(item)
}
