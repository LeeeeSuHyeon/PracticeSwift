//
//  posts.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/22/24.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
