//
//  CustomCell.swift
//  ExCollectionView+RxSwift
//
//  Created by 박준하 on 2023/03/14.
//

import UIKit
import SnapKit
import RxCocoa
import Then

class CustomCell: UICollectionViewCell {
    
    static var identifier = "CustomCell"
    
    var collectionBackground = UIView().then {
        $0.backgroundColor = .systemBackground
    }
    
    private let label = UILabel().then {
        $0.font = .systemFont(ofSize: 30.0, weight: .regular)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    public var text: String = "" {
        didSet {
            label.text = text.isEmpty ? " " : text
        }
    }
    
    func layout() {
        [
            collectionBackground,
            label
        ].forEach { contentView.addSubview($0) }
        
        collectionBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(45.0)
            $0.width.equalTo(353.0)
        }
        
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }

}
