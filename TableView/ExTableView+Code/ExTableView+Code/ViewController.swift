//
//  ViewController.swift
//  ExTableView+Code
//
//  Created by 박준하 on 2023/03/18.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    private lazy var exTableView = UITableView().then {
        $0.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        $0.delegate = self
        $0.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        layout():
    }
    
    func layout() {
        view.addSubview(exTableView)
        
        exTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
//            cell.userImage = UIImage(named: "")
//            cell.nameLabel = "박준하"
            cell.explanationLabel.text = "안녕하세요. 박준하입니다."
            return cell
            
        default:
//            cell.userImage = UIImage(named: "")
//            cell.nameLabel = "(이름 없음) "
            cell.explanationLabel.text = "내용이 없습니다."
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) 클릭됨")
    }
    
}
