//
//  SignupViewModel.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 23/11/24.
//

import UIKit
import YPImagePicker

protocol SignupViewModelDelegate: AnyObject {
    func setupView()
    func setupImageProfileButton(image: UIImage)
}

protocol SignupViewModelProtocol: AnyObject {
    var delegate: SignupViewModelDelegate? { set get }
    
    func onViewDidLoad()
    func onProfileImageButtonDidTapped(picker: YPImagePicker)
}

class SignupViewModel: SignupViewModelProtocol {
    weak var delegate: SignupViewModelDelegate?
    
    func onViewDidLoad() {
        delegate?.setupView()
    }
    
    func onProfileImageButtonDidTapped(picker: YPImagePicker) {
        picker.didFinishPicking { items, cancelled in
            if let photo = items.singlePhoto {
                DispatchQueue.main.async {
                    self.delegate?.setupImageProfileButton(image: photo.image)
                }
            }
            picker.dismiss(animated: true)
        }
    }
}
