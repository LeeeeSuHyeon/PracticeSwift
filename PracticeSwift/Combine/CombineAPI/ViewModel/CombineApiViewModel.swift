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
    
    // Todos 호출 후 조건에 따라 응답으로 Posts 호출
    func fetchTodosFilteringPosts(){
        ApiService.fetchTodosFilteringPosts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error) :
                    print("fetchTodosFilteringPosts - error : \(error)")
                case .finished :
                    print("fetchTodosFilteringPosts - finished")
                }
            }, receiveValue: { (posts : [Post]) in
                print("fetchTodosFilteringPosts - posts.count = \(posts.count)")
            })
            .store(in: &subscriptions)
    }
    
    // Todos 호출 후 응답에 따른 조건으로 다음 API 호출 결정
    // todos.count < 200 ? Posts 호출 : Users 호출
    func fetchAnotherAPIBasedOnResponse(){
        let shouldFetchPosts : AnyPublisher<Bool, Error> = {
            ApiService.fetchTodos()
                .map { $0.count < 200}
                .eraseToAnyPublisher()
        }()
        
        shouldFetchPosts
            .filter{$0 == true}
            .flatMap{ _ in
                return ApiService.fetchPosts()
            }.sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("fetchAnotherAPIBasedOnResponse - fetchPosts : err : \(error)")
                case .finished :
                    print("fetchAnotherAPIBasedOnResponse - fetchPosts - finished")
                }
                
            }, receiveValue: { recivedValue in
                print("fetchAnotherAPIBasedOnResponse - fetchPosts - posts.count : \(recivedValue.count)")
            })
            .store(in: &subscriptions)
        
        shouldFetchPosts
            .filter{$0 != true}
            .flatMap{ _ in
                return ApiService.fetchUsers()
            }.sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("fetchAnotherAPIBasedOnResponse - fetchUsers : err : \(error)")
                case .finished :
                    print("fetchAnotherAPIBasedOnResponse - fetchUsers - finished")
                }
                
            }, receiveValue: { recivedValue in
                print("fetchAnotherAPIBasedOnResponse - fetchUsers - users.count : \(recivedValue.count)")
            })
            .store(in: &subscriptions)
    }
}
