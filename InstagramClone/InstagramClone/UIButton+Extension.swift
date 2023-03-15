//
//  UIButton+Extension.swift
//  InstagramClone
//
//  Created by 박준하 on 2023/03/15.
//

import UIKit

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
