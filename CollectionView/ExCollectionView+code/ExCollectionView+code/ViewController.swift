//
//  ViewController.swift
//  ExCollectionView+code
//
//  Created by 박준하 on 2023/03/14.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    
    //items의 개수 만큼 collection 추가
    var items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // 이걸로 collectionView layout을 정합니다
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        // collectionView는 dataSource와 delegate를 지정해줍니다.
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(customCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)

        // collectionView에 layout을 만듭니다.
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    //items의 개수를 정합니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! customCell
        cell.label.text = items[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //delegateFlowLayout을 width의 길이를 정합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
        return CGSize(width: width, height: width)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    //cell을 클릭할 때의 indextPath.row를 정합니다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
