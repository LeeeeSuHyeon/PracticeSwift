//
//  CombineViewModel.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/22/24.
//

import Foundation
import Combine

class CombineApiViewModel : ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    func fetchTodos(){
        ApiService.fetchTodos()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error) :
                    print("fetchTodos - error : \(error)")
                case .finished :
                    print("fetchTodos - finished")
                }
            }, receiveValue: { receivedValue in
                print("fetchTodos - receivedValue.count = \(receivedValue.count)")
            })
            .store(in: &subscriptions)
    }
    
    func fetchPosts(){
        ApiService.fetchPosts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error) :
                    print("fetchPosts - error : \(error)")
                case .finished :
                    print("fetchPosts - finished")
                }
            }, receiveValue: { receivedValue in
                print("fetchPosts - receivedValue.count = \(receivedValue.count)")
            })
            .store(in: &subscriptions)
    }
    
    // todos + posts
    func fetchTodosAndPostAtTheSameTime(){
        ApiService.fetchTodosAndPostAtTheSameTime()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error) :
                    print("fetchTodosAndPostAtTheSameTime - error : \(error)")
                case .finished :
                    print("fetchTodosAndPostAtTheSameTime - finished")
                }
            }, receiveValue: { (todos : [Todo], posts : [Post]) in
                print("fetchTodosAndPostAtTheSameTime - todos.count = \(todos.count)")
                print("fetchTodosAndPostAtTheSameTime - posts.count = \(posts.count)")
            })
            .store(in: &subscriptions)
    }
    
    // todos 호출 후 응답으로 posts 호출
    func fetchTodosAndThenPosts(){
        ApiService.fetchTodosAndThenPosts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error) :
                    print("fetchTodosAndThenPosts - error : \(error)")
                case .finished :
                    print("fetchTodosAndThenPosts - finished")
                }
            }, receiveValue: { (posts : [Post]) in
                print("fetchTodosAndThenPosts - posts.count = \(posts.count)")
            })
            .store(in: &subscriptions)
    }
}
