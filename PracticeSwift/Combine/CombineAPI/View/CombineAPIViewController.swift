//
//  CombineAPIViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/22/24.
//

import UIKit

class CombineAPIViewController: UIViewController {
    
    var viewModel = CombineApiViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTodos(_ sender: UIButton) {
        viewModel.fetchTodos()
    }
    
    
    @IBAction func btnPost(_ sender: UIButton) {
        viewModel.fetchPosts()
    }


}
