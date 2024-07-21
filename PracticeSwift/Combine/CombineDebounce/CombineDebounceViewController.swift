//
//  CombineDebounceViewController.swift
//  PracticeSwift
//
//  Created by 이수현 on 7/21/24.
//

import UIKit
import Combine

class CombineDebounceViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    private lazy var searchController : UISearchController = {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .black
        searchController.searchBar.searchTextField.accessibilityIdentifier = "mySearchBarTextField"
        return searchController
    }()
    
    var mySubscription = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.searchController = searchController
        searchController.isActive = true
        searchController.searchBar.searchTextField
            .myDebouceSearchPublisher
            .sink{ [weak self] (receivedValue) in
                
//                guard let self = self else {return}
                
                print(receivedValue)
                self?.myLabel.text = receivedValue
            }
            .store(in: &mySubscription)
        
        
        
        
    }
    
}

extension UISearchTextField {
    var myDebouceSearchPublisher : AnyPublisher<String, Never>{
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: self)
            .compactMap{$0.object as? UISearchTextField}
            .map{$0.text ?? ""}
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)    // 데이터를 받을 시간 입력
            .filter{$0.count > 0}   // 글자가 없으면 받지 않음
            .print()
            .eraseToAnyPublisher()
    }
}
