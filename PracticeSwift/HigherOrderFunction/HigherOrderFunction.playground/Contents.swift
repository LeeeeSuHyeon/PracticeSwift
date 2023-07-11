import UIKit


// map 함수
//// for 문 사용
//let numbers = [1, 2, 3, 4, 5]
//var forUseSquaredNumbers: [Int] = []
//
//for number in numbers {
//    let squared = number * number
//    forUseSquaredNumbers.append(squared)
//}
//print(forUseSquaredNumbers) // 출력: [1, 4, 9, 16, 25]
//
//
//
//// map 함수 사용
////let numbers = [1, 2, 3, 4, 5]
//let mapUseSquaredNumbers = numbers.map { $0 * $0 }
//print(mapUseSquaredNumbers) // 출력: [1, 4, 9, 16, 25]





// filter 함수
//let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//let evenNumbers = numbers.filter { $0 % 2 == 0 }
//print(evenNumbers) // 출력: [2, 4, 6, 8, 10]
//
//
//let names = ["Alice", "Bob", "Charlie", "David", "Eve"]
//let filteredNames = names.filter { $0.count > 5 }
//print(filteredNames) // 출력: ["Charlie"]



// reduce 함수
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 }
print(sum) // 출력: 15


let words = ["Hello", " ", "World", "!"]
let sentence = words.reduce("") { $0 + $1 }
print(sentence) // 출력: "Hello World!"
