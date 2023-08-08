//
//  customCell.swift
//  ExCollectionView+code
//
//  Created by 박준하 on 2023/03/14.
//

import UIKit
import SnapKit
import Then

class customCell: UICollectionViewCell {

    var backView = UIImageView().then {
        $0.backgroundColor = .blue
    }
    var label = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        contentView.addSubview(label)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



