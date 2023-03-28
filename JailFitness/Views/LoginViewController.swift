//
//  LoginViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-03-26.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log"
        label.textColor = .black
        label.font = UIFont(name: "Poppins-Bold", size: 32)
        return label
    }()
    
    let inLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In."
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
        label.text = "New Member?"
        label.font = UIFont(name: "Poppins-Medium", size: 14)
        label.textColor = .gray
        return label
    }()
    
    let registerbtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
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
    
    let loginBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let forgotButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot me", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 16)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        addComponents()
        setupConstraints()
        
        registerbtn.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
    }
    
    @objc func goToRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addComponents() {
        hStack.addArrangedSubview(logLabel)
        hStack.addArrangedSubview(inLabel)
        mainView.addSubview(hStack)
        view.addSubview(mainView)
        
        hStack2.addArrangedSubview(memeberLabel)
        hStack2.addArrangedSubview(registerbtn)
        mainView2.addSubview(hStack2)
        view.addSubview(mainView2)
        
        view.addSubview(userLabel)
        view.addSubview(userText)
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
        
        hStack3.addArrangedSubview(checkBox)
        hStack3.addArrangedSubview(rememberLabel)
        mainView3.addSubview(hStack3)
        view.addSubview(mainView3)
        
        view.addSubview(loginBtn)
        view.addSubview(forgotButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85),
            
            hStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -240),
            hStack.topAnchor.constraint(equalTo: mainView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
        
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            hStack2.leadingAnchor.constraint(equalTo: mainView2.leadingAnchor),
            hStack2.trailingAnchor.constraint(equalTo: mainView2.trailingAnchor, constant: -190),
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
            passwordText.heightAnchor.constraint(equalToConstant: 40)
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
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginBtn.topAnchor.constraint(equalTo: mainView3.bottomAnchor, constant: 30),
            loginBtn.heightAnchor.constraint(equalToConstant: 40),
            
            forgotButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forgotButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -290),
            forgotButton.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 20)
        ])
    }

}
