//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by 박준하 on 2023/03/15.
//

import UIKit
import SnapKit
import Then

final class FeedTableViewCell: UITableViewCell {
    
    static let identity = "FeedTableViewCell"
    
    private lazy var postImageView = UIImageView().then {
        $0.backgroundColor = .tertiaryLabel
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(systemName: "heart")
    }
    
    private lazy var commentButton = UIButton().then {
        $0.setImage(systemName: "message")
    }
    
    private lazy var directMessageButton = UIButton().then {
        $0.setImage(systemName: "paperplane")
    }
    
    private lazy var bookmarkButton = UIButton().then {
        $0.setImage(systemName: "bookmark")
    }
    
    private lazy var currentLikedCountLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 13.0, weight: .semibold)
        $0.text = "박준하님 외 여러명이 좋아합니다."
    }
    
    private lazy var contensLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 13.0, weight: .medium)
        $0.numberOfLines = 5
        $0.text = "하하 코딩이 너무 재밌다 하하 코딩이 너무 재밌다 하하 코딩이 너무 재밌다 하하 코딩이 너무 재밌다 하하 코딩이 너무 재밌다 하하 코딩이 너무 재밌다 하하 코딩이 너무 재밌다"
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 11.0, weight: .semibold)
        $0.text = "1일 전"
    }
    
    func setup() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookmarkButton,
            currentLikedCountLabel,
            contensLabel,
            dateLabel
        ].forEach { addSubview($0) }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        let buttonSpacing: CGFloat = 12.0
        let labelVerticalSpacing: CGFloat = 8.0
        
        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }

        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }

        contensLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(labelVerticalSpacing)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contensLabel.snp.bottom).offset(labelVerticalSpacing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}
