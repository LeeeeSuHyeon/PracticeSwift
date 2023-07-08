//
//  BuilderPattern.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/08.
//

import Foundation


// Pet 구조 설정
struct Pet {
    var name: String? = nil
    var age : Int? = nil
}

// PetBuilder 클래스 설정
class PetBuilder {
    
    private var pet : Pet = Pet()
    
    func withName(_ name : String) -> Self{
        pet.name = name
        return self
    }
    
    func withAge(_ age : Int) -> Self{
        pet.age = age
        return self
    }
    
    func build() -> Pet {
        return self.pet
    }
}

let myPet = PetBuilder()
    .withName("야옹이")
    .withAge(10)
    .build()

myPet
