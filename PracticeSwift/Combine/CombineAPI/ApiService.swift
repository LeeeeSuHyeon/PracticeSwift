//
//  ApiService.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/22/24.
//

import Foundation
import Combine

enum API {
    case fetchTodos // 할 일 가져오기
    case fetchPosts // 포스트 가져오기
    
    var url : URL {
        switch self {
        case .fetchTodos : return URL(string: "https://jsonplaceholder.typicode.com/todos")!
        case .fetchPosts : return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        }
    }
}


enum ApiService {
    // static : 객체 인스턴스를 만들지 않아도 함수 호출 가능
    static func fetchTodos() -> AnyPublisher<[Todo], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchTodos.url)
            .map{$0.data}
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func fetchPosts(_ todosCount : Int = 0) -> AnyPublisher<[Post], Error> {
        print("fetchPosts - todos.count = \(todosCount)")
        return URLSession.shared.dataTaskPublisher(for: API.fetchPosts.url)
            .map{$0.data}
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    // API 두 개 동시 호출
    static func fetchTodosAndPostAtTheSameTime() -> AnyPublisher<([Todo], [Post]), Error> {
        let fetchedTodos = fetchTodos()
        let fetchedPosts = fetchPosts()
        return Publishers
            .CombineLatest(fetchedTodos, fetchedPosts)
            .eraseToAnyPublisher()
    }
    
    
    // Todos 호출 후 응답으로 Posts 호출
    static func fetchTodosAndThenPosts() -> AnyPublisher<[Post], Error> {
        return fetchTodos().flatMap{ todos in
            fetchPosts(todos.count).eraseToAnyPublisher()   // 매개 변수로 활용
        }.eraseToAnyPublisher()
        
    }
}

