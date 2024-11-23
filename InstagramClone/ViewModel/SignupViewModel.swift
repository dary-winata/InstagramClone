//
//  SignupViewModel.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 23/11/24.
//

protocol SignupViewModelDelegate: AnyObject {
    func setupView()
}

protocol SignupViewModelProtocol: AnyObject {
    var delegate: SignupViewModelDelegate? { set get }
    
    func onViewDidLoad()
}

class SignupViewModel: SignupViewModelProtocol {
    weak var delegate: SignupViewModelDelegate?
    
    func onViewDidLoad() {
        delegate?.setupView()
    }
}
