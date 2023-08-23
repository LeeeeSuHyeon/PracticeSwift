import UIKit

// 열거형 타입
enum Animal : String {
    case cat = "A"
    case dog
    case cow
}

let cat1 : Animal = Animal.cat  // cat
let dog1 : Animal = Animal.dog  // dog
let cow1 : Animal = Animal.cow  // cow

print(cat1.rawValue) // 0.0
print(dog1.rawValue) // 1.0
print(cow1.rawValue) // 2.0
