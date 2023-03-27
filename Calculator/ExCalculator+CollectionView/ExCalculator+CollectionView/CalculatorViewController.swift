//
//  CalculatorViewController.swift
//  ExCalculator+CollectionView
//
//  Created by 박준하 on 2023/03/27.
//

import UIKit
import SnapKit
import Then

enum Operator {
    case plus
    case minus
    case multiply
    case divide
}

class CalculatorViewController: UIViewController {
    
    // 계산기 안에 넣는 코드 선언
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(CalculatorCell.self, forCellWithReuseIdentifier: CalculatorCell.identifier)
    }
    
    // 버튼을 배열로 선언하면 선언 코드를 아낄 수 있습니다.
    private let buttons: [[String]] = [
        ["C", "±", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    private var currentNumber = ""
    private var currentOperator: Operator?
    
    private let resultLabel = UILabel().then {
        $0.textAlignment = .right
        $0.font = UIFont.systemFont(ofSize: 60)
        $0.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        layout()
        navgetionTitle()
    }
    
    private func navgetionTitle() {
        title = "계산기"
    }
    
    private func layout() {
        view.addSubview(resultLabel)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CalculatorViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10) / 4
        //이건 좀 공부하면 대충 보임
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //최소 간격
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //최소 간격
        return 0
    }
}

// MARK: - UICollectionViewDataSource

extension CalculatorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorCell.identifier, for: indexPath) as! CalculatorCell
        let buttonText = buttons[indexPath.section][indexPath.row]
        cell.button.setTitle(buttonText, for: .normal)
        cell.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        switch buttonText {
        case "C":
            cell.button.setTitleColor(.red, for: .normal)
        case "=", "+", "-", "×", "÷":
            cell.button.setTitleColor(.orange, for: .normal)
        default:
            cell.button.setTitleColor(.black, for: .normal)
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons[section].count
    }
}


extension CalculatorViewController {
    @objc private func didTapButton(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else {
            return
        }
        
        switch buttonText {
        case "C":
            resultLabel.text = "0"
            print("초기화했습니다.")
            
        case "+", "-", "×", "÷":
            if let currentOperator = currentOperator {
                switch currentOperator {
                case .plus:
                    resultLabel.text = String(Double(currentNumber)! + Double(resultLabel.text!)!)
                case .minus:
                    resultLabel.text = String(Double(resultLabel.text!)! - Double(currentNumber)!)
                case .multiply:
                    resultLabel.text = String(Double(currentNumber)! * Double(resultLabel.text!)!)
                case .divide:
                    resultLabel.text = String(Double(resultLabel.text!)! / Double(currentNumber)!)
                }
            }
            
            //이거 해주는 이유는 위에가 ( if let )이라서야
            currentNumber = ""
            
            switch buttonText {
            case "+":
                currentOperator = .plus
            case "-":
                currentOperator = .minus
            case "×":
                currentOperator = .multiply
            case "÷":
                currentOperator = .divide
            default:
                break
            }
            
        case "=":
            if let currentOperator = currentOperator {
                switch currentOperator {
                case .plus:
                    resultLabel.text = String(Double(currentNumber)! + Double(resultLabel.text!)!)
                    print("curentNumber + resultLabel = \(String(Double(currentNumber)! + Double(resultLabel.text!)!))")
                case .minus:
                    resultLabel.text = String(Double(resultLabel.text!)! - Double(currentNumber)!)
                    print("curentNumber - resultLabel = \(String(Double(currentNumber)! - Double(resultLabel.text!)!))")
                case .multiply:
                    resultLabel.text = String(Double(currentNumber)! * Double(resultLabel.text!)!)
                    print("curentNumber * resultLabel = \(String(Double(currentNumber)! * Double(resultLabel.text!)!))")
                case .divide:
                    resultLabel.text = String(Double(resultLabel.text!)! / Double(currentNumber)!)
                    print("curentNumber / resultLabel = \(String(Double(currentNumber)! / Double(resultLabel.text!)!))")
                }
            }
            currentNumber = ""
            currentOperator = nil
        default:
            currentNumber += buttonText
            resultLabel.text = currentNumber
        }
    }
}


// MARK: - CalculatorCell

class CalculatorCell: UICollectionViewCell {
    static let identifier = "CalculatorCell"
    
    let button = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
