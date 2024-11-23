//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 23/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Username"
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 43).isActive = true
        button.backgroundColor = .blue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signupStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var signupLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Don't have account? "
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(signupButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
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

extension LoginViewController: LoginViewModelDelegate {
    func setupView() {
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        view.addSubview(loginStack)
        view.addSubview(signupStack)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 143),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -143),
            
            loginStack.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 107),
            loginStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            loginStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
//            loginStack.bottomAnchor.constraint(greaterThanOrEqualTo: signupStack.bottomAnchor, constant: -16),
            
            signupStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            signupStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        loginStack.addArrangedSubview(usernameTextField)
        loginStack.addArrangedSubview(passwordTextField)
        loginStack.addArrangedSubview(loginButton)
        
        signupStack.addArrangedSubview(signupLabel)
        signupStack.addArrangedSubview(signupButton)
    }
}

private extension LoginViewController {
    @objc
    func signupButtonDidTapped() {
        let signupVM = SignupViewModel()
        let signupVC = SignupViewController(viewModel: signupVM)
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @objc
    func loginButtonDidTapped() {
        print("login")
    }
}
