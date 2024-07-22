//
//  todos.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/22/24.
//

import Foundation

// MARK: - Todo
struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
