//
//  HomePostBottomView.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 14/10/24.
//

import UIKit

class HomePostBottomView: UIView {
    private lazy var postActionStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "12 Likes"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
//    private lazy var commentProflieImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person.crop.circle")
//        imageView.tintColor = .systemGray
//        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return imageView
//    }()
//    
//    private lazy var comment
    
    private lazy var timestampIntervalLabel: UILabel = {
        let label = UILabel()
        label.text = "1 hour ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomePostBottomView {
    func setupView() {
        addSubview(postActionStack)
        addSubview(likeCountLabel)
        addSubview(timestampIntervalLabel)
        
        NSLayoutConstraint.activate([
            postActionStack.topAnchor.constraint(equalTo: topAnchor),
            postActionStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            postActionStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            likeCountLabel.topAnchor.constraint(equalTo: postActionStack.bottomAnchor, constant: 10),
            likeCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            timestampIntervalLabel.topAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: 6),
            timestampIntervalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            timestampIntervalLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        postActionStack.addArrangedSubview(likeButton)
        postActionStack.addArrangedSubview(commentButton)
        postActionStack.addArrangedSubview(shareButton)
    }
}
