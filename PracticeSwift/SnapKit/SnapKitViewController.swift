//
//  SnapKitViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/07/20.
//

import UIKit
import snapKit

class SnapKitViewController: UIViewController {

    lazy var redView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()

        override func viewDidLoad() {
            super.viewDidLoad()

            view.addSubview(redView)

            redView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalTo(100)
                make.height.equalTo(100)
            }
        }
   

}


 /*
미리 보기 기능 (UIKit에서 SwiftUI를 쓰는 방법) - 렌더링
SwiftUI 코드
opt + Cmd + Enter
  */

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    SnapKitViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
