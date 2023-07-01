//
//  AlamofireViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/01.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let param = AlamofireRequest(start: "시작", end: "끝")
        postAlamofire(param)
        
    }
    
    func postAlamofire(_ parameters: AlamofireRequest) {
        AF.request("http://43.200.179.53:3000/add", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: AlamofireResponse.self) { [self] response in
                switch response.result {
                case .success(let response):
                    if(response.success == true){
                        print("서버에 데이터 전달 받기 성공")
                        navigationController?.popViewController(animated: true)
                    
                        print(response.data ?? 0, response.message, response.success)
                        
                    }
                    
                    else{
                        print("서버에 데이터 전달 받기 실패 \(response.message)")
                        //alert message
                        let FailAlert = UIAlertController(title: "경고", message: response.message, preferredStyle: UIAlertController.Style.alert)
                        
                        let FailAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                        FailAlert.addAction(FailAction)
                        self.present(FailAlert, animated: true, completion: nil)
                    }
                    
                    
                case .failure(let error):
                    print(error)
                    print("서버 통신 실패")
                    let serverFailAlert = UIAlertController(title: "경고", message: "서버 통신에 실패하였습니다.", preferredStyle: UIAlertController.Style.alert)
                    
                    let serverFailAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    serverFailAlert.addAction(serverFailAction)
                    self.present(serverFailAlert, animated: true, completion: nil)
                }
                
            }
    }

}
