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

    // Todos + Posts 동시 호출
    @IBAction func btnTodosAndPosts(_ sender: UIButton) {
        viewModel.fetchTodosAndPostAtTheSameTime()
    }
    
    // Todos 호출 후 응답으로 Posts 호출
    @IBAction func btnTodoesAndThenPosts(_ sender: UIButton) {
        viewModel.fetchTodosAndThenPosts()
    }
}
