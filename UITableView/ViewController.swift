import UIKit
import SafariServices

import RxSwift
import RxCocoa

//struct Place: Decodable {
//    let name: String
//    let desc: String
//    let url: String
//}
class ViewController: UIViewController {
//    let characters: Variable<[String]> = Variable(["Link", "Zelda", "Ganondorf", "Midna"])
    let disposeBag = DisposeBag()
    let tableView = UITableView()
//    let places: BehaviorRelay<[Place]> = BehaviorRelay(value: [])
    let characters: BehaviorRelay<[String]> = BehaviorRelay(value:["Link", "Zelda", "Ganondorf", "Midna"])

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Travel"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        view.backgroundColor = .white

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
        ])

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        characters.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, model, cell in
            cell.textLabel?.text = "hello"
            print(self.characters)
            cell.textLabel?.numberOfLines = 0
            cell.selectionStyle = .none
        }.disposed(by: disposeBag)

        tableView.rx.modelSelected(Place.self)
            .map{ URL(string: $0.url) }
            .subscribe(onNext: { [weak self] url in
                guard let url = url else {
                    return
                }
                self?.present(SFSafariViewController(url: url), animated: true)
        }).disposed(by: disposeBag)


    }

}




//import UIKit
//
//
//
//class ViewController: UIViewController {
//
//    var tableView = UITableView()
////    var places: [Place] = [ name: "shivani" , desc: "bang" ,url :" www.google.com"]
////    var places: [Place] = []
//     var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(tableView)
//        view.backgroundColor = .white
//
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.dataSource = self
//
////        fetchData()
//    }
//
////    func fetchData() {
////        if let url = URL(string: "https://api.myjson.com/bins/hg9uk") {
////            URLSession.shared.dataTask(with: url) { data, response, error in
////                if let data = data {
////                    do {
////                        let places = try JSONDecoder().decode([Place].self, from: data)
////                        DispatchQueue.main.async {
////                            self.places = places
////                            self.tableView.reloadData()
////                        }
////                    } catch let error {
////                        print(error)
////                    }
////                }
////            }.resume()
////        }
////    }
//
//}
//
//extension ViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//            return characters.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
////            cell.textLabel?.text = "\(places[indexPath.row].name), \(places[indexPath.row].desc)"
////         cell.textLabel?.text = "\(indexPath.row)"
//        cell.textLabel?.text = characters[indexPath.row]
//        print(indexPath.row)
//            cell.textLabel?.numberOfLines = 0
//        return cell
//    }
//}




//import UIKit
//
//
//
//class ViewController: UIViewController {
//
//    var tableView = UITableView()
//    var places: [Place]?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(tableView)
//        view.backgroundColor = .white
//
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.dataSource = self
//
//        fetchData()
//    }
//
//    func fetchData() {
//        if let url = URL(string: "https://api.myjson.com/bins/hg9uk") {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//                    do {
//                        let places = try JSONDecoder().decode([Place].self, from: data)
//                        DispatchQueue.main.async {
//                            self.places = places
//                            self.tableView.reloadData()
//                        }
//                    } catch let error {
//                        print(error)
//                    }
//                }
//            }.resume()
//        }
//    }
//
//}
//
//extension ViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let places = places {
//            return places.count
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        if let places = places {
//            cell.textLabel?.text = "\(places[indexPath.row].name), \(places[indexPath.row].desc)"
//            cell.textLabel?.numberOfLines = 0
//        }
//        return cell
//    }
//}




//import UIKit
//import SafariServices
//
//import RxSwift
//import RxCocoa
//
////struct Place: Decodable {
////    let name: String
////    let desc: String
////    let url: String
////}
//class ViewController: UIViewController {
//
//    let disposeBag = DisposeBag()
//    let tableView = UITableView()
//    let places: BehaviorRelay<[Place]> = BehaviorRelay(value: [])
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Travel"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        view.addSubview(tableView)
//        view.backgroundColor = .white
//
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
//        ])
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//        places.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, model, cell in
//            cell.textLabel?.text = "\(model.name), \(model.desc)"
//            cell.textLabel?.numberOfLines = 0
//            cell.selectionStyle = .none
//        }.disposed(by: disposeBag)
//
//        tableView.rx.modelSelected(Place.self)
//            .map{ URL(string: $0.url) }
//            .subscribe(onNext: { [weak self] url in
//                guard let url = url else {
//                    return
//                }
//                self?.present(SFSafariViewController(url: url), animated: true)
//        }).disposed(by: disposeBag)
//
//        fetchData()
//    }
//
//    func fetchData() {
//        if let url = URL(string: "https://api.myjson.com/bins/16w6h0") {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//                    do {
//                        let places = try JSONDecoder().decode([Place].self, from: data)
//                        self.places.accept(places)
//                    } catch let error {
//                        print(error)
//                    }
//                }
//            }.resume()
//        }
//    }
//
//}
//
//
