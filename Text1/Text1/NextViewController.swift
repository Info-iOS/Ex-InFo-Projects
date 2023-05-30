//
//  NextViewController.swift
//  Text1
//
//  Created by 박준하 on 2023/04/14.
//

import SnapKit
import Then
import UIKit

class NextViewController: UIViewController {
    
    private lazy var dismissButton = UIButton().then {
        $0.backgroundColor = .red
        $0.addTarget(self, action: #selector(dismissDidTap), for: .touchUpInside)
        $0.setTitle("dismiss", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100.0)
        }
    }
    
    @objc func dismissDidTap() {
        self.dismiss(animated: true)
    }
}
