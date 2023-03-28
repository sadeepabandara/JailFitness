//
//  RegisterViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-03-25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Register"
        label.textColor = .black
        label.font = UIFont(name: "Poppins-Bold", size: 32)
        return label
    }()
    
    let dotLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "."
        label.textColor = .orange
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
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.orange , for: .normal)
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
    
    let userLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.textColor = .gray
        label.font = UIFont(name: "Poppins-Medium", size: 16)
        return label
    }()
    
    let userText : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
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
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        textField.keyboardType = .default
        return textField
    }()
    
    let confirmPasswordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirm Password"
        label.textColor = .gray
        label.font = UIFont(name: "Poppins-Medium", size: 16)
        return label
    }()
    
    let confirmPasswordText : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        textField.keyboardType = .default
        return textField
    }()
    
    let checkBox : UISwitch = {
        let check = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.frame = CGRect(x: 50, y: 50, width: 0, height: 0)
        check.onTintColor = .orange
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
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        addComponents()
        setupConstraints()
        
        loginbtn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc func goToLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
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
        
        view.addSubview(userLabel)
        view.addSubview(userText)
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordText)
        
        hStack3.addArrangedSubview(checkBox)
        hStack3.addArrangedSubview(rememberLabel)
        mainView3.addSubview(hStack3)
        view.addSubview(mainView3)
        
        view.addSubview(registerBtn)
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
            userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userLabel.topAnchor.constraint(equalTo: mainView2.bottomAnchor, constant: 20),
            
            userText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userText.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 10),
            userText.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordLabel.topAnchor.constraint(equalTo: userText.bottomAnchor, constant: 20),
            
            passwordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordText.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordText.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 20),
            
            confirmPasswordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPasswordText.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10),
            confirmPasswordText.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            rememberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            hStack3.leadingAnchor.constraint(equalTo: mainView3.leadingAnchor),
            hStack3.trailingAnchor.constraint(equalTo: mainView3.trailingAnchor),
            hStack3.topAnchor.constraint(equalTo: mainView3.topAnchor),
            hStack3.bottomAnchor.constraint(equalTo: mainView3.bottomAnchor),
            
            mainView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainView3.topAnchor.constraint(equalTo: confirmPasswordText.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerBtn.topAnchor.constraint(equalTo: mainView3.bottomAnchor, constant: 30),
            registerBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
