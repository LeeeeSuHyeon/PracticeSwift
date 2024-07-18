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


// Just Publisher
let justPublisher = Just("Hello, Combine!")
justPublisher.sink(receiveCompletion: { completion in
    print("Completed with: \(completion)")
}, receiveValue: { value in
    print("Received value: \(value)")
})


// future Publisher
let futurePublisher = Future<String, Error> { promise in
    // 비동기 작업 수행
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        let result = "Async result"
        promise(.success(result))
        // 또는 promise(.failure(someError)) 호출
    }
}

futurePublisher.sink(receiveCompletion: { completion in
    print("Completed with: \(completion)")
}, receiveValue: { value in
    print("Received value: \(value)")
})



// PassthroughSubject Publisher
let passthroughSubject = PassthroughSubject<String, Never>()

passthroughSubject.sink(receiveCompletion: { completion in
    print("Completed with: \(completion)")
}, receiveValue: { value in
    print("Received value: \(value)")
})

passthroughSubject.send("First value")
passthroughSubject.send("Second value")



// CurrentValueSubject Publisher
let currentValueSubject = CurrentValueSubject<String, Never>("Initial value")

currentValueSubject.sink(receiveCompletion: { completion in
    print("Completed with: \(completion)")
}, receiveValue: { value in
    print("Received value: \(value)")
})

currentValueSubject.send("Updated value")
print("Current value: \(currentValueSubject.value)") // 최신 값을 직접 접근 가능
