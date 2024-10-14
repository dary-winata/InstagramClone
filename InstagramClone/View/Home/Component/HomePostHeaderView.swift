//
//  HomePostHeaderView.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 13/10/24.
//

import UIKit

class HomePostHeaderView: UIView {
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.image = UIImage(systemName: "person")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomePostHeaderView {
    func setupViews() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -16),
            
            moreButton.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
