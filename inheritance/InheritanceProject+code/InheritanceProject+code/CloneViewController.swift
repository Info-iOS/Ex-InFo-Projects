//
//  CloneViewController.swift
//  InheritanceProject+code
//
//  Created by 이은호 on 2023/03/28.
//

import UIKit
import Then
import SnapKit

class CloneViewController: BaseBaxViewController {
    
    internal var c = UIButton().then {
        $0.backgroundColor = .cyan
    }
    
    override func viewDidLoad() {
        updateWith(self)
        
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        controller.view.addSubview(c)
        
        c.snp.makeConstraints {
            $0.top.equalTo(b.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100.0)
        }
    }
}
