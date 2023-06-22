//
//  SocketIOManager.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/20.
//

import Foundation
import SocketIO


// Singleton으로 구현됨
class SocketIOManager {
    
    // 인스턴스를 가져오려면 shared를 사용
    static let shared = SocketIOManager()
    
    // 소켓 연결 관리
    private let manager: SocketManager
    
    // manager.defaultSocekt을 통해 기본 소켓을 가져옴
    let socket: SocketIOClient
    
    private init() {
        manager = SocketManager(socketURL: URL(string: "http://localhost:9000")!, config: [.log(true), .compress])
        socket = manager.defaultSocket
        
        // 소켓 이벤트 설정
        setupSocketEvents()
    }
    

    
    /* 채팅 메시지를 전송
        "msg" 이벤트에 닉네임과 메시지를 담아 서버로 전송 */
    func sendMessage(message: String, nickname: String) {
        let data: [String: Any] = [
            "nick": nickname,
            "msg": message
        ]
        
        /* socket.emit 메서드의 두 번째 파라미터로 completion 클로저 사용
            completion 파라미터는 'msg' 이벤트에 대한 전송 작업이 완료되었을 때 호출되는 클로저*/
        socket.emit("msg", with: [data]) {
            print("Message sent with acknowledgment")
        }

    }
    
    
    
    // 소켓 연결 수립, 서버와의 통신 시작
    func establishConnection() {
        socket.connect()
    }
    
    // 소켓 연결 종료
    func closeConnection() {
        socket.disconnect()
    }
    
    
    /* 소켓 이벤트 설정
        소켓 연결 ('connect')와 연결 해제 ('disconnect') 이벤트 처리
        "test" 이벤트를 수신할 때마다 데이터를 콘솔에 출력함
     */
    private func setupSocketEvents() {
        socket.on(clientEvent: .connect) { _, _ in
            print("Socket connected")
        }
        
        socket.on(clientEvent: .disconnect) { _, _ in
            print("Socket disconnected")
        }
        
        
        /* 'test' 라는 이벤트를 수신할 때 호출되는 이벤트 핸들러
            data는 소켓으로부터 전달받은 데이터를 의미하며, [[String: Any]] 형태로 캐스팅하여 사용합니다.
         */
        socket.on("test") { data, _ in
            if let dataArray = data as? [[String: Any]] {
                print(dataArray)
            }
        }
    }
}

