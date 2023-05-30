//
//  RegisterViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-03-25.
//

import UIKit
import Combine

class RegisterViewController: UIViewController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    let customOrange = UIColor(red: 249.0/255.0, green: 155.0/255.0, blue: 125.0/255.0, alpha: 1)
    
    let registerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Register"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 32)
        return label
    }()
    
    let dotLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "."
        label.textColor = customYellow
        label.font = UIFont(name: "Poppins-Bold", size: 32)
        return label
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    let mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let memeberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alreay a Member?"
        label.font = UIFont(name: "Poppins-Medium", size: 14)
        label.textColor = .gray
        return label
    }()
    
    let loginbtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(customYellow , for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14)
        return button
    }()
    
    let hStack2 : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    let mainView2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .gray
        label.font = UIFont(name: "Poppins-Medium", size: 16)
        return label
    }()
    
    let emailText : UITextField = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        textField.backgroundColor = customBlueLight
        textField.keyboardType = .default
        return textField
    }()
    
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .gray
        label.font = UIFont(name: "Poppins-Medium", size: 16)
        return label
    }()
    
    let passwordText : UITextField = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        textField.isSecureTextEntry = true
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.backgroundColor = customBlueLight
        textField.layer.shadowRadius = 1
        textField.keyboardType = .default
        return textField
    }()
    
    //    let confirmPasswordLabel : UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.text = "Confirm Password"
    //        label.textColor = .gray
    //        label.font = UIFont(name: "Poppins-Medium", size: 16)
    //        return label
    //    }()
    //
    //    let confirmPasswordText : UITextField = {
    //        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    //        let textField = UITextField()
    //        textField.translatesAutoresizingMaskIntoConstraints = false
    //        textField.borderStyle = .roundedRect
    //        textField.layer.shadowOpacity = 0.1
    //        textField.layer.shadowColor = UIColor.gray.cgColor
    //        textField.layer.shadowRadius = 1
    //        textField.backgroundColor = customBlueLight
    //        textField.keyboardType = .default
    //        return textField
    //    }()
    
    let checkBox : UISwitch = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let check = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.frame = CGRect(x: 50, y: 50, width: 0, height: 0)
        check.onTintColor = customYellow
        return check
    }()
    
    let rememberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remember me"
        label.font = UIFont(name: "Poppins-Light", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let hStack3 : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    let mainView3 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.isEnabled = false
        return button
    }()
    
    let googleBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Sign up with Google", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white , for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = customYellow.cgColor
        button.setImage(UIImage(named: "googleIcon"), for: .normal)
        return button
    }()
    
    var viewModel = AuthenticationViewModel()
    var subscriptions: Set<AnyCancellable> = []
    
    func bindViews() {
        emailText.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        viewModel.$isAuthenticationFormValid.sink { [weak self] validationState in
            self?.registerBtn.isEnabled = validationState
        }
        .store(in: &subscriptions)
        
        viewModel.$user.sink { [weak self] user in
            guard user != nil else { return }
            let view = GenderViewController()
            guard let vc = self?.navigationController?.pushViewController(view, animated: true) as? ViewController else { return }
            vc.dismiss(animated: true)
        }
        .store(in: &subscriptions)
        
        viewModel.$error.sink { [weak self] errorString in
            guard let error = errorString else { return }
            self?.presentAlert(with: error)
        }
        .store(in: &subscriptions)
    }
    
    func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }
    
    @objc func didChangeEmailField() {
        viewModel.email = emailText.text
        viewModel.validateRegistrationForm()
    }
    
    @objc func didChangePasswordField() {
        viewModel.password = passwordText.text
        viewModel.validateRegistrationForm()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow

        addComponents()
        setupConstraints()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        loginbtn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        
        registerBtn.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        googleBtn.addTarget(self, action: #selector(goToGender), for: .touchUpInside)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        
        bindViews()
    }
    
    @objc func didTapRegister() {
        let data = UserDefaults.standard
        let email = emailText.text
        let password = passwordText.text
        data.set(email, forKey: "Email")
        data.set(password, forKey: "Password")
        
        viewModel.createUser()
    }
    
    @objc func didTapToDismiss() {
        view.endEditing(true)
    }
    
    var tabBarHeight: CGFloat = 0.0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
            if #available(iOS 11.0, *) {
                // Adjust the top anchor of the mainView to account for the tabBar height
                mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -tabBarHeight).isActive = true
            } else {
                // Adjust the top anchor of the mainView to account for the tabBar height
                mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: -tabBarHeight).isActive = true
            }
    }
    
    @objc func goToLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToGender() {
        let vc = GenderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToNext() {
        errorLabel?.removeFromSuperview()
        let email = emailText.text ?? ""
        let password = passwordText.text ?? ""
        
        if isValidEmail(email) && isValidPassword(password) {
            let vc = GenderViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            displayErrorMessage("Enter a valid email and password")
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    var errorLabel: UILabel?
    
    func displayErrorMessage(_ message: String) {
        errorLabel?.removeFromSuperview()
        
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        errorLabel.textColor = customOrange
        errorLabel.textAlignment = .center
        errorLabel.text = message
        
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: googleBtn.bottomAnchor, constant: 10)
        ])
        
        self.errorLabel = errorLabel
    }
    
    func addComponents() {
        hStack.addArrangedSubview(registerLabel)
        hStack.addArrangedSubview(dotLabel)
        mainView.addSubview(hStack)
        view.addSubview(mainView)
        
        hStack2.addArrangedSubview(memeberLabel)
        hStack2.addArrangedSubview(loginbtn)
        mainView2.addSubview(hStack2)
        view.addSubview(mainView2)
        
        view.addSubview(emailLabel)
        view.addSubview(emailText)
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
//        view.addSubview(confirmPasswordLabel)
//        view.addSubview(confirmPasswordText)
        
        hStack3.addArrangedSubview(checkBox)
        hStack3.addArrangedSubview(rememberLabel)
        mainView3.addSubview(hStack3)
        view.addSubview(mainView3)
        
        view.addSubview(registerBtn)
        view.addSubview(googleBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dotLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
            
            hStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -150),
            hStack.topAnchor.constraint(equalTo: mainView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
        
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            hStack2.leadingAnchor.constraint(equalTo: mainView2.leadingAnchor),
            hStack2.trailingAnchor.constraint(equalTo: mainView2.trailingAnchor, constant: -175),
            hStack2.topAnchor.constraint(equalTo: mainView2.topAnchor),
            hStack2.bottomAnchor.constraint(equalTo: mainView2.bottomAnchor),
            
            mainView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainView2.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailLabel.topAnchor.constraint(equalTo: mainView2.bottomAnchor, constant: 20),
            
            emailText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailText.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordLabel.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 20),
            
            passwordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordText.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordText.heightAnchor.constraint(equalToConstant: 40),
            
//            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            confirmPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 20),
//
//            confirmPasswordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            confirmPasswordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            confirmPasswordText.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10),
//            confirmPasswordText.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            rememberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            hStack3.leadingAnchor.constraint(equalTo: mainView3.leadingAnchor),
            hStack3.trailingAnchor.constraint(equalTo: mainView3.trailingAnchor),
            hStack3.topAnchor.constraint(equalTo: mainView3.topAnchor),
            hStack3.bottomAnchor.constraint(equalTo: mainView3.bottomAnchor),
            
            mainView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainView3.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerBtn.topAnchor.constraint(equalTo: mainView3.bottomAnchor, constant: 30),
            registerBtn.heightAnchor.constraint(equalToConstant: 40),
            
            googleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            googleBtn.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 20),
            googleBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
