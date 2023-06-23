//
//  MainViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 2023/06/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func NavButton(_ sender: UIButton) {
        guard let OtherVC = storyboard?.instantiateViewController(withIdentifier: "OtherViewController") else { return }
        
        navigationController?.pushViewController(OtherVC, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
