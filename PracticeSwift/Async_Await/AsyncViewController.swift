//
//  AsyncViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/14.
//

import UIKit

class AsyncViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        func process() async {
            do {
                let data = try await fetchData()
                // 데이터를 가지고 추가 작업을 수행
            } catch {
                // 에러 처리
            }
        }

    }
    

    
    func fetchData() async throws -> Data {
        let url = URL(string: "https://example.com/data")!
        let (data, _) = try await URLSession.shared.data(from: url)
     
        return data
    }

}
