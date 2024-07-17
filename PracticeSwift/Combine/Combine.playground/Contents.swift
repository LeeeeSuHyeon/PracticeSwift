import UIKit
import Combine
import Foundation


// Subscirber - sink
var myPublisher : Publishers.Sequence<[Int], Never> = [1,2,3].publisher

myPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("성공")
    case .failure(let failure):
        print("실패 : \(failure)")
    }
}, receiveValue: { receivedValue in
    print("receivedValue : \(receivedValue)")
    
})


// Subscirber - assign
class MyFreind {
    var name = "철수" {
        didSet {
            print("name - didSet() : ", name)
        }
    }
}

var myFriend = MyFreind()
var myFriendSubscription : AnyCancellable = ["영수"].publisher.assign(to: \.name, on: myFriend)
