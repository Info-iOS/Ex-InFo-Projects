//
//  ViewController.swift
//  ProgressView+Code
//
//  Created by 박준하 on 2023/03/18.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let progressView = UIProgressView()
    let progressButton = UIButton().then {
        $0.setTitle("Update Progress", for: .normal)
        $0.addTarget(self, action: #selector(updateProgress), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(progressView)
        view.addSubview(progressButton)
        
        progressView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(50.0)
        }
        
        progressButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(progressView.snp.bottom).offset(50)
        }
        
    }
    
    @objc func updateProgress() {
        let newProgress = progressView.progress + 0.1
        progressView.setProgress(newProgress, animated: true)

    }
}

