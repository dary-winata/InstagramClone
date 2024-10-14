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
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
        
        NSLayoutConstraint.activate([
            homePostHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            homePostHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            homePostHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: homePostHeaderView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
