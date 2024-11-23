//
//  SignupViewController.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 23/11/24.
//

import UIKit

class SignupViewController: UIViewController {
    private lazy var imageProfileButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 40
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signupStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var emailTextfield: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Email"
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Full Name"
        textField.textColor = .black
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Username"
        textField.textColor = .black
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 43).isActive = true
        button.backgroundColor = .blue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signupButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Already have an account? "
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let viewModel: SignupViewModelProtocol
    
    init(viewModel: SignupViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onViewDidLoad()
    }
}

extension SignupViewController: SignupViewModelDelegate {
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(imageProfileButton)
        self.view.addSubview(signupStack)
        self.view.addSubview(loginStack)
        
        NSLayoutConstraint.activate([
            imageProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signupStack.topAnchor.constraint(equalTo: imageProfileButton.bottomAnchor, constant: 40),
            signupStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            signupStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            
            loginStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            loginStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        signupStack.addArrangedSubview(emailTextfield)
        signupStack.addArrangedSubview(passwordTextField)
        signupStack.addArrangedSubview(fullNameTextField)
        signupStack.addArrangedSubview(usernameTextField)
        signupStack.addArrangedSubview(signupButton)
        
        loginStack.addArrangedSubview(loginLabel)
        loginStack.addArrangedSubview(loginButton)
    }
}

private extension SignupViewController {
    @objc
    func loginButtonDidTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func signupButtonDidTapped() {
        print("registerButtonDidTapped")
    }
}
