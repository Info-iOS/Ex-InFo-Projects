//
//  ViewController.swift
//  MoveScreen+Code
//
//  Created by 박준하 on 2023/03/17.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    private lazy var presentFullButton = UIButton().then {
        $0.backgroundColor = .red
        $0.addTarget(self, action: #selector(presentFullButtonDidTap), for: .touchUpInside)
        $0.setTitle("present", for: .normal)
    }
    
    private lazy var pushButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(pushButtonDidTap), for: .touchUpInside)
        $0.setTitle("push", for: .normal)
    }
    
    private lazy var automaticButton = UIButton().then {
        $0.backgroundColor = .green
        $0.addTarget(self, action: #selector(automaticButtonDidTap), for: .touchUpInside)
        $0.setTitle("automatic", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(presentFullButton)
        view.addSubview(pushButton)
        view.addSubview(automaticButton)
        
        presentFullButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100.0)
        }
        
        pushButton.snp.makeConstraints {
            $0.top.equalTo(presentFullButton.snp.bottom).offset(100.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100.0)
        }
        
        automaticButton.snp.makeConstraints {
            $0.top.equalTo(pushButton.snp.bottom).offset(100.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100.0)
        }
    }


    @objc func presentFullButtonDidTap() {
        print("prsent")
        let viewController = UINavigationController(rootViewController: NextViewController())
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true)
    }
    
    @objc func pushButtonDidTap() {
        print("push")
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }
    
    @objc func automaticButtonDidTap() {
        print("automatic")
        let viewController = UINavigationController(rootViewController: NextViewController())
        viewController.modalPresentationStyle = .automatic
            self.present(viewController, animated: true)
    }
}

