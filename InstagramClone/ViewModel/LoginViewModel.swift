//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 23/11/24.
//


protocol LoginViewModelProtocol: AnyObject {
    var delegate: LoginViewModelDelegate? { get set }
    
    func onViewDidLoad()
}

protocol LoginViewModelDelegate: AnyObject {
    func setupView()
}

class LoginViewModel: LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate?
    
    func onViewDidLoad() {
        delegate?.setupView()
    }
}
