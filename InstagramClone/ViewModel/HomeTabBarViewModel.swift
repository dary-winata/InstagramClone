//
//  HomeTabBarViewModel.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 12/10/24.
//

import Foundation

protocol HomeTabBarViewModelDelegate: AnyObject {
    func setupView()
}

protocol HomeTabBarViewModelProtocol: AnyObject {
    var delegate: HomeTabBarViewModelDelegate? { get set }
    func viewWillAppear()
}

class HomeTabBarViewModel: HomeTabBarViewModelProtocol {
    weak var delegate: HomeTabBarViewModelDelegate?
    
    func viewWillAppear() {
        delegate?.setupView()
    }
}
