//
//  BaseBaxViewController.swift
//  InheritanceProject+code
//
//  Created by 이은호 on 2023/03/28.
//

import UIKit
import Then
import SnapKit

class BaseBaxViewController: UIViewController {
    
    internal var a = UIButton().then {
        $0.backgroundColor = .purple
    }
    
    internal var b = UIButton().then {
        $0.backgroundColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
    }
    
    func updateWith(_ controller: UIViewController) {
        
        view.backgroundColor = .white
        
        controller.view.addSubview(a)
        controller.view.addSubview(b)
        
        a.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100.0)
            $0.height.width.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        
        b.snp.makeConstraints {
            $0.top.equalTo(a.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100.0)
        }
    }
}
