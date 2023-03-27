//
//  ViewController.swift
//  CircleView+Code
//
//  Created by 박준하 on 2023/03/19.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
//    var circleView = UIView().then {
//        $0.backgroundColor = .red
//        $0.layer.cornerRadius = 100.0
//    }
    
    var viewButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 50.0
        $0.addTarget(self, action: #selector(viewButtonDidTap), for: .touchUpInside)
        $0.setTitle("안녕하세요", for: .normal)
        $0.setTitleColor(.red, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(circleView)
//        circleView.translatesAutoresizingMaskIntoConstraints = false
//        circleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        circleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//
//        circleView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        circleView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
//        view.addSubview(circleView)
//        circleView.snp.makeConstraints {
//            $0.height.equalTo(20.0)
//            $0.width.equalTo(50.0)
//            $0.centerY.centerX.equalToSuperview()
//        }
        
        view.backgroundColor = .white
        
        view.addSubview(viewButton)
        viewButton.snp.makeConstraints {
            $0.height.width.equalTo(200.0)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func viewButtonDidTap() {
        print("은호야 공부해")
        changeBackgroud()
    }
    
    func changeBackgroud() {
        viewButton.backgroundColor = .red
    }
}
