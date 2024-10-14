//
//  HomeViewModel.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 13/10/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func setupView()
}

protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewModelDelegate? { get set }
    func onViewDidLoad()
}

class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?
    
    func onViewDidLoad() {
        delegate?.setupView()
    }
}
