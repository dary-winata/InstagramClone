//
//  HomeCollectionViewCell.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 13/10/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    private lazy var homePostHeaderView: HomePostHeaderView = {
        let homePostHeaderView = HomePostHeaderView()
        homePostHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return homePostHeaderView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var bottomFeedView: HomePostBottomView = {
        let bottomFeed = HomePostBottomView()
        bottomFeed.translatesAutoresizingMaskIntoConstraints = false
        
        return bottomFeed
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeCollectionViewCell {
    func setupView() {
        contentView.addSubview(homePostHeaderView)
        contentView.addSubview(imageView)
        contentView.addSubview(bottomFeedView)
        
        NSLayoutConstraint.activate([
            homePostHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            homePostHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            homePostHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: homePostHeaderView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
//            imageView.bottomAnchor.constraint(equalTo: bottomFeedView.topAnchor),
            
            bottomFeedView.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor),
            bottomFeedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bottomFeedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bottomFeedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
