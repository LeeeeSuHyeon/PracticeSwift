//
//  MVP_UserProfilePresenter.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/05.
//

import Foundation

// 프리젠터 (Presenter)
class MVP_UserProfilePresenter {
    private let user: MVP_User
    private weak var view: MVP_UserProfileView?

    init(user: MVP_User, view: MVP_UserProfileView) {
        self.user = user
        self.view = view
    }

    func updateUserProfile() {
        view?.showUserName(user.name)
        view?.showUserAge(user.age)
    }
}
