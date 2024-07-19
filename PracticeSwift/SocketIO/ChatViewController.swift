////
////  ViewController.swift
////  PracticeSwift
////
////  Created by 이수현 on 2023/06/20.
////
//
//import UIKit
//import SocketIO
//
//class ChatViewController: UIViewController {
//    
//    // 소켓 통신 관련 프로퍼티
//    let socketManager = SocketIOManager.shared
//    
//    
//    // 채팅방 아이디로 사용
//    var roomId: String = ""
//    
//    // 메시지를 표시할 테이블뷰와 메시지 텍스트뷰
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var msgTextField: UITextField!
//    
//    
//    // 전체 메시지들을 저장할 배열
//    var messages: [Message] = []
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let myMsg = Message(content: "ㅎㅇㅎㅇ", isMyMessage: true)
//        let otherMsg = Message(content: "ㅎㅇㅎㅇㅎㅇ", isMyMessage: false)
//        
//        addMessageToChat(myMsg)
//        addMessageToChat(otherMsg)
//        
//        
//        // 소켓 이벤트 핸들러 등록
//        socketManager.socket.on("receiveMessage") { [weak self] data, _ in
//            guard let messageData = data.first as? [String: Any],
//                  let message = Message(data: messageData) else {
//                return
//            }
//            
//            // 상대방이 보낸 메시지를 표시
//            self?.addMessageToChat(message)
//        }
//    }
//    
//    // 메시지를 채팅방에 추가
//    func addMessageToChat(_ message: Message) {
//        messages.append(message)
//        tableView.reloadData()
//    }
//    
//    
//    // 메시지 전송 버튼 액션
//    @IBAction func sendMessage(_ sender: UIButton) {
//        guard let text = msgTextField.text else {
//            return
//        }
//        
//        // 내가 보낸 메시지를 표시
//        let myMessage = Message(content: text, isMyMessage: true)
//        addMessageToChat(myMessage)
//        
//        // 메시지 서버로 전송
//        let data: [String: Any] = ["roomId": roomId, "message": text]
//        socketManager.socket.emit("sendMessage", data)
//        
//        // 메시지 입력 필드 초기화
//        msgTextField.text = ""
//        
//        tableView.reloadData()
//        print(messages.count)
//    }
//}
//    
//
//
//struct Message {
//    let content: String
//    let isMyMessage: Bool
//    
//    init(content: String, isMyMessage: Bool) {
//        self.content = content
//        self.isMyMessage = isMyMessage
//    }
//    
//    init?(data: [String: Any]) {
//        guard let content = data["message"] as? String,
//              let isMyMessage = data["isMyMessage"] as? Bool else {
//            return nil
//        }
//        
//        self.content = content
//        self.isMyMessage = isMyMessage
//    }
//}
//
//
//
//extension ChatViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.messages.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let message = messages[indexPath.row]
//        let cellIdentifier = message.isMyMessage ? "MyMessageCell" : "OtherMessageCell"
//        
//        
//        if (cellIdentifier == "MyMessageCell"){
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyMessageCell
//            cell.myMessageLabel.text = message.content
//            return cell
//        } else{
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OtherMessageCell
//            cell.otherMessageLabel.text = message.content
//            return cell
//        }
//    }
//
//    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let message = messages[indexPath.row]
////        let cellIdentifier = message.isMyMessage ? "MyMessageCell" : "OtherMessageCell"
////        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
////        cell.messageLabel.text = message.content
////        return cell
////    }
//}
//
//
