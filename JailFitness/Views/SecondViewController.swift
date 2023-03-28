//
//  SecondViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-03-23.
//

import UIKit
import AVKit
import AVFoundation

class SecondViewController: UIViewController {
    
    let jailFitnessImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "firstImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 28, weight: .heavy)
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Volume Up Your Body Goals, You Can Do Better Today With Your Goals"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let registerBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    let loginBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()

    
    let orLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Or"
        return label
    }()
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 16, weight: .light)
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "The hard days are the best because that's when champions are made."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let googleBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up with Google", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black , for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.orange.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addComponents()
        setupConstraints()
        
        registerBtn.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        
        loginBtn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc func goToRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addComponents() {
        view.addSubview(jailFitnessImage)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(registerBtn)
        view.addSubview(loginBtn)
        view.addSubview(orLabel)
        view.addSubview(googleBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            jailFitnessImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            jailFitnessImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            jailFitnessImage.topAnchor.constraint(equalTo: view.topAnchor),
            jailFitnessImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450)
        ])
        
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstLabel.topAnchor.constraint(equalTo: jailFitnessImage.bottomAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            registerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerBtn.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 20),
            registerBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginBtn.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 20),
            loginBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            orLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orLabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            googleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            googleBtn.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            googleBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
