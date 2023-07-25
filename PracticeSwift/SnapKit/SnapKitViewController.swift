//
//  SnapKitViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/20.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {

    
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
    
    
    lazy var yellowView : UIView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .yellow
        
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
//    var blueViewTopLayoutConstraint : NSLayoutConstraint? = nil
    
    
    
    // Top Anchor의 제약 조건을 나타내는 Constraint 타입의 옵셔널 변수
    var blueViewTopConstraint : Constraint? = nil
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.addSubview(redView)
            self.view.addSubview(blueView)
            self.view.addSubview(yellowView)
            
            let myGreenButton = myButton(.green)
            self.view.addSubview(myGreenButton)
            
            
            redView.snp.makeConstraints { make in
//                make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40))
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40))
            }
            
            blueView.snp.makeConstraints { make in
                
                // 높이 넓이 : 100으로 지정
                make.height.width.equalTo(100)
                
                make.centerX.equalTo(self.view)
                
                // blueView의 top을 redView의 top에 맞추면 offset을 40으로 두어 패딩 설정
//                make.top.equalTo(self.redView.snp.top).offset(40)
                
                
                // blueView의 TopAnchor 제약 조건을 설정하고 이를 blueViewTopConstraint 변수에 할당
                self.blueViewTopConstraint = make.top.equalTo(self.redView.snp.top).offset(40).constraint
                
                
                // blueView의 top을 viewController의 safeAreaLayoutGuide의 top에 맞춤
//                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
              
                
                // blueView를 superView의 center에 맞춰서 정가운데에 놓음
//                make.center.equalToSuperview()
                
                // blueView의 넓이를 redView의 넓이와 맞춤
//                make.width.equalTo(self.redView.snp.width)
                
                // blueView의 넓이를 redView의 넓이의 1.1배로 맞춤
//                make.width.equalTo(self.redView.snp.width).multipliedBy(1.1)
                
                // blueView의 넓이를 redView의 넓이의 1/5배로 맞춤
//                make.width.equalTo(self.redView.snp.width).dividedBy(5)
            }
            
            myGreenButton.snp.makeConstraints { make in
                make.width.equalTo(200)
                make.height.equalTo(100)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
            
            myGreenButton.addTarget(self, action: #selector(moveBlueViewDown), for: .touchUpInside)
            
            
            yellowView.snp.makeConstraints { make in
                make.width.height.equalTo(100)
                make.centerX.centerY.equalToSuperview()
                
            }
            
            
            
            
//            myGreenButton.translatesAutoresizingMaskIntoConstraints = false
//
//            NSLayoutConstraint.activate([
//                myGreenButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//                myGreenButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//            ])
//
            
//
//
            
//            // 오토레이아웃 지정할 때 false 설정 필수
//            redView.translatesAutoresizingMaskIntoConstraints = false
//            blueView.translatesAutoresizingMaskIntoConstraints = false
//
//            redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
//            redView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
//            redView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
//            redView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
//
//
//
//            blueViewTopLayoutConstraint = blueView.topAnchor.constraint(equalTo: self.redView.topAnchor, constant: 40)
//
//
//            // blueView - AutoLayout
//            NSLayoutConstraint.activate([
//                blueView.widthAnchor.constraint(equalToConstant: 100),
//                blueView.heightAnchor.constraint(equalToConstant: 100),
//                blueView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//
//            ])
//
//            blueViewTopLayoutConstraint?.isActive = true
            
            
        
        }
    
    
    
    var offset = 0
   
    @objc fileprivate func moveBlueViewDown(){
        offset += 40
        print("ViewController : moveBlueViewDown(), offset : \(offset)")
        
//        blueViewTopLayoutConstraint?.constant = CGFloat(offset)

        // blueView의 TopAnchor 제약 조건을 업데이터
        self.blueViewTopConstraint?.update(offset: offset)

    }
}




 /*
미리 보기 기능 (UIKit에서 SwiftUI를 쓰는 방법) - 렌더링
SwiftUI 코드
opt + Cmd + Enter
  */

//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//    
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//@available(iOS 13.0.0, *)
//func makeUIViewController(context: Context) -> UIViewController{
//    SnapKitViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
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
