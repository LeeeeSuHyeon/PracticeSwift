//
//  UIKitViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/23.
//

import UIKit

class UIKitViewController: UIViewController {

    // 빨간색 뷰
    lazy var redView: UIView = { () -> UIView in
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()     // '()' 추가하여 viewDidLoad()에서 addSubview(redView()) 추가 시 () 사용 안 해도 됨

    // 파란색 뷰
    lazy var blueView: UIView = { () -> UIView in
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }()
    
    
    // 버튼 추가
    lazy var myButton = { (color : UIColor) -> UIButton in
        let btn = UIButton(type: .system)
        btn.backgroundColor = color
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("내 버튼 ", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        btn.layer.cornerRadius = 15
        return btn
    }
    
    
    // NSLayoutConstraint 타입은 Auto Layout의 제약 조건을 나타내는 클래스로 blueView - Top Anchor의 constant를 변경하기 위해 사용
     var blueViewTopLayoutConstraint : NSLayoutConstraint? = nil
    
    
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.addSubview(redView)
            self.view.addSubview(blueView)
            
            let myGreenButton = myButton(.green)
            self.view.addSubview(myGreenButton)
            
            myGreenButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                myGreenButton.widthAnchor.constraint(equalToConstant: 200),
                myGreenButton.heightAnchor.constraint(equalToConstant: 100),
                myGreenButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                myGreenButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//                myGreenButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
            
            myGreenButton.addTarget(self, action: #selector(moveBlueViewDown), for: .touchUpInside)
            
            
            
            // 오토레이아웃 지정할 때 false 설정 필수
            redView.translatesAutoresizingMaskIntoConstraints = false
            blueView.translatesAutoresizingMaskIntoConstraints = false
            
            redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
            redView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
            redView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
            redView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
            
            
            
            blueViewTopLayoutConstraint = blueView.topAnchor.constraint(equalTo: self.redView.topAnchor, constant: 40)
            
            // blueView - AutoLayout
            NSLayoutConstraint.activate([
                blueView.widthAnchor.constraint(equalToConstant: 100),
                blueView.heightAnchor.constraint(equalToConstant: 100),
                blueView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                
            ])
            
            blueViewTopLayoutConstraint?.isActive = true
            
            
            

//
//            // redView의 크기 지정
//            redView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
//            redView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7).isActive = true
//
//            // redView의 위치 지정
//            redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            redView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
            

//            view.addSubview(redView)
//
//            redView.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.centerY.equalToSuperview()
//                make.width.equalTo(100)
//                make.height.equalTo(100)
//            }
        }
    
    
    
    var offset = 0
   
    @objc fileprivate func moveBlueViewDown(){
        offset += 40
        print("ViewController : moveBlueViewDown(), offset : \(offset)")
        
        blueViewTopLayoutConstraint?.constant = CGFloat(offset)
    }
}




 /*
미리 보기 기능 (UIKit에서 SwiftUI를 쓰는 방법) - 렌더링
SwiftUI 코드
opt + Cmd + Enter
  */

//#if DEBUG
//import SwiftUI
//struct UIKitViewControllerRepresentable: UIViewControllerRepresentable {
//    
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//@available(iOS 13.0.0, *)
//func makeUIViewController(context: Context) -> UIViewController{
//    UIKitViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct UIViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName("Preview")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//        
//    }
//} #endif
