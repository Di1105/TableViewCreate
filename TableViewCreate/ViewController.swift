//
//  ViewController.swift
//  TableViewCreate
//
//  Created by Dilara Elçioğlu on 22.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    let tableView = UITableView()
    var array = [String]()
    var cell = UITableViewCell()
    var tappedCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUpUI()
        for x in 0...10{
            array.append("\(x+1).sayfaya git")
        }
    }

    func setUpUI(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        tableView.backgroundColor = .lightGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //Sola çekince cell yeşil yapıldı
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let action = UIContextualAction(style: .normal, title: title) { (action, view, completion) in
                // 3
                let cell = self.tableView.cellForRow(at: indexPath)
                cell?.backgroundColor = .systemGreen
                completion(true)
            }
            //action.image = UIImage(systemName: "heart.fill")
            action.backgroundColor = .green
            let configuration = UISwipeActionsConfiguration(actions: [action])
            return configuration
    }
    //sağa çekince hücre gri yapıldı
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: nil) { action, view, completion in
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .systemGray
            completion(true)
        }
        action.backgroundColor = .gray
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        
        if indexPath.row == 0 {
            let rootVC = FirstPageVC()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }else if indexPath.row == 1{
            let rootVC = SecondPageVC()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }else if indexPath.row == 2{
            let rootVC = ThirdPageVC()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }else if indexPath.row == 3{
            let rootVC = FourthPageVC()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        array.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
}

class FirstPageVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "First Page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackPushed))
    }
    @objc func goBackPushed(){
        dismiss(animated: true)
    }
}

class SecondPageVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Second Page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackPushed))
    }
    @objc func goBackPushed(){
        dismiss(animated: true)
    }
}

class ThirdPageVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Third Page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackPushed))
    }
    @objc func goBackPushed(){
        dismiss(animated: true)
    }
}

class FourthPageVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Fourth Page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackPushed))
    }
    @objc func goBackPushed(){
        dismiss(animated: true)
    }
}



