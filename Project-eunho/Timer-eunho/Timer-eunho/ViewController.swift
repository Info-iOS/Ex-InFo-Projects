//
//  ViewController.swift
//  Timer-eunho
//
//  Created by 박준하 on 2023/03/21.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var timer = Timer()
    var seconds = 60
    
    var timerLable = UILabel().then {
        $0.text = "60"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 60)
    }

    var startButton = UIButton().then {
        $0.setTitle("start", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        $0.addTarget(self, action: #selector(startButton), for: .touchUpInside)
    }
    
    var pauseButton = UIButton().then {
        $0.setTitle("pause", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        $0.addTarget(self, action: #selector(pauseButton), for: .touchUpInside)
    }
    
    var resetButton = UIButton().then {
        $0.setTitle("reset", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        $0.addTarget(self, action: #selector(resetButton), for: .touchUpInside)
    }
    
    var addFive = UIButton().then {
        $0.setTitle("addFive", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        $0.addTarget(self, action: #selector(addFive), for: .touchUpInside)
    }
    
    var minusFive = UIButton().then {
        $0.setTitle("minusFive", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        $0.addTarget(self, action: #selector(minusFive), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        layout()
        
    }
    
    //시작
    @objc func startButton(_ sender: Any)
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerClass), userInfo: nil, repeats: true)
    }
    //멈춤
    @objc func pauseButton(_ sender: Any)
    {
        timer.invalidate()
    }
    //리셋
    @objc func resetButton(_ sender: Any)
    {
        timer.invalidate()
        seconds = 60
        timerLable.text = String(seconds)
    }
    //5+
    @objc func addFive(_ sender: Any)
    {
        seconds = seconds + 5
        timerLable.text = String(seconds)
    }
    //-5
    @objc func minusFive(_ sender: Any)
    {
        seconds = seconds - 5
        timerLable.text = String(seconds)
    }
    
    @objc func timerClass()
    {
        seconds -= 1
        timerLable.text = String(seconds)
        if(seconds == 0)
        {
            timer.invalidate()
        }
    }

    
    func layout() {
        view.addSubview(timerLable)
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resetButton)
        view.addSubview(addFive)
        view.addSubview(minusFive)
        
        timerLable.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    
        startButton.snp.makeConstraints{
            $0.top.equalTo(timerLable.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        pauseButton.snp.makeConstraints{
            $0.top.equalTo(startButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        resetButton.snp.makeConstraints{
            $0.top.equalTo(pauseButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        addFive.snp.makeConstraints{
            $0.top.equalTo(resetButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        minusFive.snp.makeConstraints{
            $0.top.equalTo(addFive.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        
    }
}

