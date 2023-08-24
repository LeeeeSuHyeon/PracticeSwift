import UIKit

extension Int {
    var squared : Int {
        return self * self
    }
}

let num = 10
print(num.squared) // 100

extension String {
    func greet(){
        print("Hello, \(self)")
    }
}

let swift = "Swift"
print(swift.greet()) // Hello, Swift



extension Int {
    init?(value : String){
        self.init(value)
    }
}

let stringValue = "42"
print(type(of: stringValue))            // String

let intValue = Int(value: stringValue)   // 42
print(type(of: intValue))                // Optional<Int>


//
//class ViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource {
// 
//    override func viewDidLoad() {
//    }
// 
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    }
// 
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    }
// 
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    }
// 
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    }
//}

//class ViewController: UIViewController {
//    override func viewDidLoad() {
//    }
//}
// 
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    }
// 
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    }
//}
// 
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    }
// 
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    }
//}

