//
//  ThenViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/08/14.
//

import UIKit
import SnapKit
import Then

class ThenViewController: UIViewController {

//    let label : UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.textColor = .blue
//        label.text = "Using 'Then' Library"
//
//        return label
//    }()
    
    
    
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .blue
            $0.text = "Using 'Then' Library"
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(label)
        
        label.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
