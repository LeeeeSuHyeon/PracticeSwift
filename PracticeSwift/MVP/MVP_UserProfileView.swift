//
//  MVP_UserProfileView.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/05.
//

import Foundation

// 뷰 (View)
protocol MVP_UserProfileView: AnyObject {
    func showUserName(_ name: String)
    func showUserAge(_ age: Int)
}
