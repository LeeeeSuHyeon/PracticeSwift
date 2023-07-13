import UIKit

//var numbers = [4, 2, 1, 3]
//numbers.sort()
//print(numbers) // 출력: [1, 2, 3, 4]
//
//numbers.sort(by: >)
//print(numbers) // 출력: [4, 3, 2, 1]


let numbers = [4, 2, 1, 3]
let sortedNumbers = numbers.sorted()
print(sortedNumbers) // 출력: [1, 2, 3, 4]

let descSortedNumbers = numbers.sorted(by: >)
print(descSortedNumbers) // 출력: [4, 3, 2, 1]
