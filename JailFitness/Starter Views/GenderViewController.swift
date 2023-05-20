//
//  GenderViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-16.
//

import UIKit

class GenderViewController: UIViewController {

    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "genderImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let selectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "What is your gender?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let maleBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Male", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let femaleBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Female", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
        
        addComponents()
        setupConstraints()
        
        maleBtn.addTarget(self, action: #selector(goToAgeMale), for: .touchUpInside)
        
        femaleBtn.addTarget(self, action: #selector(goToAgeFemale), for: .touchUpInside)
    }
    
    @objc func goToAgeMale() {
        let data = UserDefaults.standard
        data.setValue("Male", forKey: "Gender")
        
        let vc = AgeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToAgeFemale() {
        let data = UserDefaults.standard
        data.setValue("Female", forKey: "Gender")
        
        let vc = AgeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addComponents() {
        view.addSubview(coverImage)
        view.addSubview(selectLabel)
        view.addSubview(maleBtn)
        view.addSubview(femaleBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450)
        ])
        
        NSLayoutConstraint.activate([
            selectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 120),
        ])
        
        
        NSLayoutConstraint.activate([
            maleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            maleBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            maleBtn.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 20),
            maleBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            femaleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            femaleBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            femaleBtn.topAnchor.constraint(equalTo: maleBtn.bottomAnchor, constant: 20),
            femaleBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
