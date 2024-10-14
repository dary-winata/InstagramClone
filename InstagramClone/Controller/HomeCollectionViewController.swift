//
//  HomeCollectionViewController.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 13/10/24.
//

import UIKit

private let reuseIdentifier = "home_cell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let viewModel: HomeViewModel
    
    init(collectionViewLayout layout: UICollectionViewLayout, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onViewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
}

extension HomeCollectionViewController: HomeViewModelDelegate {
    func setupView() {
        self.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
