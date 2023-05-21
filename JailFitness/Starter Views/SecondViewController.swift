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
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
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
    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "The hard days are the best because that's when champions are made."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let registerBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let loginBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
        
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
            firstLabel.topAnchor.constraint(equalTo: jailFitnessImage.bottomAnchor, constant: 100),
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
    }

}
