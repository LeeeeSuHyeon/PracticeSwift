//
//  OtherViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/23.
//

import UIKit

class OtherViewController: UIViewController {

    @IBAction func dismissButton(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
