import UIKit

//// key 값은 String 형태, value 값은 Int 형태인 빈 Dictionary 생성
//var studentScores = [String : Int]()
// var studentScores : Dictionary<String, Int> = [:]

//studentScores["홍길동"] = 90
//studentScores["김길동"] = 70
//
//print(studentScores)     //  ["김길동": 70, "홍길동": 90]


// key 값은 String 형태, value 값은 Int 형태인 빈 Dictionary 생성
var studentScores = ["홍길동" : 90, "김길동" : 80, "이길동" : 100]

studentScores["박길동"] = 10
studentScores["최길동"] = 60

print(studentScores)     //  ["김길동": 80, "이길동": 100, "최길동": 60, "박길동": 10, "홍길동": 90]


var hongScore = studentScores["홍길동"]    // 90


print(studentScores)     //  ["김길동": 80, "이길동": 100, "최길동": 60, "박길동": 10, "홍길동": 90]

// Dictionary 항목 개수
print(studentScores.count) // 5

// Dictionary key 값으로 value 값 접근 -> 키로 입력한 값이 딕셔너리에 없을 수 있으므로 옵셔널 값으로 출력함
print(studentScores["홍길동"], studentScores["김길동"])   // Optional(90) Optional(80)

// 항목 업데이트 :  "홍길동" 이라는 키의 값을 0으로 업데이트
studentScores.updateValue(0, forKey: "홍길동")
print(studentScores["홍길동"]) // Optional(0)


// 항목 삭제 : "홍길동" 이라는 키가 있으면 딕셔너리에서 삭제
studentScores.removeValue(forKey: "홍길동")
print(studentScores)    // ["이길동": 100, "박길동": 10, "최길동": 60, "김길동": 80]

studentScores["이길동"] = nil
print(studentScores)    // ["최길동": 60, "김길동": 80, "박길동": 10]


// tuple을 이용한 딕셔너리 항목 접근
for (key, value) in studentScores {
    print(key, value)
}
//박길동 10
//최길동 60
//김길동 80


// 딕셔너리 키 값만 접근
for key in studentScores.keys{
    print(key)
}
//박길동
//김길동
//최길동


// 딕셔너리 value 값만 접근
for value in studentScores.values{
    print(value)
}

//10
//80
//60

print(studentScores)                            // ["박길동": 10, "김길동": 80, "최길동": 60]

var student = studentScores.keys
print(student)                                  // ["박길동", "김길동", "최길동"]
print(type(of: student))                        // Keys 타입

var arrayStudent = [String](studentScores.keys) // Array의 init으로 String Array로 변경
print(arrayStudent)                             // ["박길동", "김길동", "최길동"]
print(type(of: arrayStudent))                   // Array<String> 타입
