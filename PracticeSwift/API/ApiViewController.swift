//
//  ApiViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/30.
//

import UIKit
import Foundation

class ApiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // URL 생성, 농림 축산 식품 공공데이터 API 가져오기
        guard let url = URL(string: "http://211.237.50.150:7080/openapi/sample/xml/Grid_20160624000000000348_1/1/5?AUCNG_DE=20160612"
        ) else {
            print("유효한 URL을 생성할 수 없습니다.")
            return
        }


        // URL 세션 생성
        let session = URLSession.shared

        // 데이터 다운로드 작업 생성
        let task = session.dataTask(with: url) { (data, response, error) in
            // 네트워크 요청이 완료된 후 실행되는 클로저

            // 에러 처리
            if let error = error {
                print("데이터 다운로드 중 에러 발생: \(error)")
                return
            }

            // 응답 확인
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("유효한 HTTP 응답이 아닙니다.")
                return
            }

            // 데이터 확인
            if let data = data {
                // 데이터를 원하는 방식으로 처리합니다.
                // 예를 들어, JSON 데이터를 파싱하거나 파일로 저장할 수 있습니다.
                print("다운로드된 데이터: \(data)")
            }
            
        }
        
        

        // 작업 시작
        task.resume()
    }
    


}
