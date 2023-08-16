import UIKit

// 데이터 저장 (데이터 - 키)
UserDefaults.standard.set("홍길동", forKey: "userName")
UserDefaults.standard.set(25, forKey: "userAge")
UserDefaults.standard.set(true, forKey: "isStudent")

// 데이터 검색
let userName = UserDefaults.standard.string(forKey: "userName")
let userAge = UserDefaults.standard.integer(forKey: "userAge")
let isStudent = UserDefaults.standard.bool(forKey: "isStudent")

print("userName : \(userName), userAge : \(userAge), isStudent : \(isStudent)")



// 딕셔너리 형태로 UserDefaults에 저장
let defaultValues : [String : Any] = [
    "userName" : "Guest",
    "age" : 20,
    "isTrue" : false
]

// 데이터 저장
UserDefaults.standard.set(defaultValues, forKey: "defaultValue")

// 데이터 검색
let value = UserDefaults.standard.dictionary(forKey: "defaultValue")

// 옵셔널 바인딩
if let name = value?["userName"] as? String {
    print("\(name)")    // 출력 : Guest
}

if let age = value?["age"] as? Int {
    print("\(age)")      // 출력 : 20
}

if let isTrue = value?["isTrue"] as? Bool {
    print("\(isTrue)")   // 출력 : false
}
