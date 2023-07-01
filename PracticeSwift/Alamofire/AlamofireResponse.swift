//
//  AlamofireResponse.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/01.
//

import Foundation

struct AlamofireResponse : Decodable{
    var data : Int?
    var success : Bool
    var message : String
    var property : Int
}

