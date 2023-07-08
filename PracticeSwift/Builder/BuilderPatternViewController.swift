//
//  BuilderPatternViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/08.
//

import UIKit

class BuilderPatternViewController: UIViewController {

//    // Pet 구조체 설정
//    struct Pet {
//        var name: String? = nil
//        var age : Int? = nil
//    }
//
//    // PetBuilder 빌더 클래스 설정
//    class PetBuilder {
//
//        private var pet : Pet = Pet()
//
//
//        // 빌더 인스턴스 자신을 반환
//        func withName(_ name : String) -> Self{
//            pet.name = name
//            return self
//        }
//
//        func withAge(_ age : Int) -> Self{
//            pet.age = age
//            return self
//        }
//
//        // 최종적으로 Pet 구조체를 생성하고 반환
//        func build() -> Pet {
//            return self.pet
//        }
//    }
    
    
    // Pet 구조체 설정
    struct Pet {
        var name: String? = nil
        var age : Int? = nil
        
        init() {}
        init(builder : SecondPetBuilder){   //SeconPetBuilder를 인자로 받아 해당 빌더의 속성을 사용하여 Pet 초기화
            self.name = builder.name
            self.age = builder.age
        }
    }
    
    
    class SecondPetBuilder {
        var name: String? = nil
        var age : Int? = nil
        
        typealias BuilderClosure = (SecondPetBuilder) -> ()
        
        init(buildClosure : BuilderClosure){
            buildClosure(self)
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let petBuilder = SecondPetBuilder { builder in
            builder.name = "댕댕이"
            builder.age = 10
        }
        
        let mySecondPet = Pet(builder: petBuilder)
        
        print(mySecondPet)
//        let myPet = PetBuilder()
//            .withName("야옹이")
//            .withAge(10)
//            .build()
//
//       print(myPet)
    }

}
