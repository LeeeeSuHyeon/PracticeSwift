//
//  CompletionViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/15.
//

import UIKit

class CompletionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData { result in
            switch result {
            case .success(let data):
                // 데이터를 가져오는 작업이 성공한 경우
                self.handleSuccess(data: data)
            case .failure(let error):
                // 데이터를 가져오는 작업이 실패한 경우
                self.handleError(error: error)
            }
        }
    }
    
    
    
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: "https://example.com/data")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                // 데이터가 없는 경우에 대한 처리
            }
        }.resume()
    }
    
    
    
    func handleSuccess(data: Data) {
        // 데이터를 성공적으로 처리하는 로직
    }
    
    func handleError(error: Error) {
        // 에러를 처리하는 로직
    }
}
