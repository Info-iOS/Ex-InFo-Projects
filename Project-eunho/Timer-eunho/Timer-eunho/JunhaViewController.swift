//
//  JunhaViewController.swift
//  Timer-eunho
//
//  Created by 박준하 on 2023/03/21.
//

import UIKit
import SnapKit
import Then

class JunhaViewController: UIViewController {
    
    var timer = Timer()
    var seconds = 60
    
    var timerLable = UILabel().then {
        $0.text = "string"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 40)
    }

    var startButton = UIButton().then {
        $0.setTitle("Start", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 40.0, weight: .medium)
    }
    
    var pauseButton = UIButton().then {
        $0.setTitle("Pause", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    var resetButton = UIButton().then {
        $0.setTitle("reset", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    var addFive = UIButton().then {
        $0.setTitle("+5", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    var minusFive = UIButton().then {
        $0.setTitle("-5", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        layout()
    }
    
    func layout() {
        [
            timerLable,
            startButton,
            pauseButton,
            resetButton,
            addFive,
            minusFive
        ].forEach { view.addSubview($0) }
        
        timerLable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200.0)
            $0.centerX.equalToSuperview()
        }
        
    }
}
