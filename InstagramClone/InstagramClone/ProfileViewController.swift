//
//  ProfiledViewController.swift
//  InstagramClone
//
//  Created by 박준하 on 2023/03/15.
//

import UIKit
import SnapKit
import Then

final class ProfileViewController: UIViewController {
    private lazy var profileImageView = UIImageView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 40.0
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemBackground.cgColor
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.text = "박준하"
        $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.text = "아아 공부하기 싫다"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.numberOfLines = 0
    }
    
    private lazy var followButton = UIButton().then {
        $0.setTitle("팔로우", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.backgroundColor = .systemBlue
        
        $0.layer.cornerRadius = 3.0
    }
    
    private lazy var messageButton = UIButton().then {
        $0.setTitle("메세지", for: .normal)
        $0.setTitleColor(.label, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        $0.backgroundColor = .systemBackground
        
        $0.layer.cornerRadius = 3.0
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
    }
    
    private let photoDataView = ProfileDataView(title: "게시물", count: 1)
    private let followerDataView = ProfileDataView(title: "팔로워", count: 240)
    private let followingDataView = ProfileDataView(title: "팔로잉", count: 106)
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        setupLayout()
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell
        
        cell?.setup(with: UIImage())
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width / 3) - 1.0
        return CGSize(width: width, height: width)
    }
}

private extension ProfileViewController {
    func setupNavigationItems() {
        navigationItem.title = "jn_xhx"
        
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: #selector(didTapRightButtonItem)
        )
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func didTapRightButtonItem() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
       
        [
            UIAlertAction(title: "회원정보 변경", style: .default),
            UIAlertAction(title: "탈퇴하기", style: .destructive),
            UIAlertAction(title: "닫기", style: .cancel)
        ].forEach { actionSheet.addAction($0) }
        
        present(actionSheet, animated: true)

    }
    
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews:
                              [followButton,messageButton])
        //두 버튼의 간격은 무조건 4
        buttonStackView.spacing = 4.0
        //두버튼의 width는 같도록
        buttonStackView.distribution = .fillEqually
        
        let dataStackView = UIStackView(arrangedSubviews:
                            [photoDataView,followerDataView,followingDataView]
        )
        dataStackView.spacing = 4.0
        dataStackView.distribution = .fillEqually
        
        [
            profileImageView,
            dataStackView,
            nameLabel,
            descriptionLabel,
            buttonStackView,
            collectionView
        ].forEach { view.addSubview($0) }
        
        let inset: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileImageView.snp.width)
        }

        dataStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(12.0)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }

        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview()
        }
    }
    
}
