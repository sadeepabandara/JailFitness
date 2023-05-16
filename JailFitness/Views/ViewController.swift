//
//  ViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let topImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "topImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Welcome to Jail Fitness"
        return label
    }()
    
    let secLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 16, weight: .light)
        label.font = UIFont(name: "Poppins-Light", size: 16)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = "With this app, You can acheive your dream body..."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let button : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Building Your Body", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    let mainHolderView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        addComponents()
        setupConstraints()
        
        button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    func addComponents() {
        view.addSubview(topImage)
        view.addSubview(firstLabel)
        view.addSubview(secLabel)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImage.topAnchor.constraint(equalTo: view.topAnchor),
            topImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250)
        ])
        
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            secLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.topAnchor.constraint(equalTo: secLabel.bottomAnchor, constant: 10),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
//        NSLayoutConstraint.activate([
//            vStack.leadingAnchor.constraint(equalTo: mainHolderView.leadingAnchor),
//            vStack.trailingAnchor.constraint(equalTo: mainHolderView.trailingAnchor),
//            vStack.topAnchor.constraint(equalTo: mainHolderView.topAnchor),
//            vStack.bottomAnchor.constraint(equalTo: mainHolderView.bottomAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            mainHolderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainHolderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mainHolderView.topAnchor.constraint(equalTo: view.topAnchor),
//            mainHolderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
}

