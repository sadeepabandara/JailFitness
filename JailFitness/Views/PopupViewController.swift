//
//  PopupViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-20.
//

import UIKit

class PopupViewController: UIViewController {
    
    let popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.text = "Are you sure?"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let noButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("No", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.backgroundColor = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let yesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Yes", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.backgroundColor = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(popupView)
        popupView.addSubview(messageLabel)
        popupView.addSubview(noButton)
        popupView.addSubview(yesButton)
        
        // Add target actions for buttons
        noButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: 250),
            
            messageLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            
            noButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            noButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            noButton.widthAnchor.constraint(equalToConstant: 100),
            noButton.heightAnchor.constraint(equalToConstant: 40),
            
            yesButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            yesButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            yesButton.widthAnchor.constraint(equalToConstant: 100),
            yesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func closePopup() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func logout() {
        // Perform the logout operation here
        // ...
        // Example: Redirect to the login screen
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
}
