//
//  ExperienceViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-17.
//

import UIKit

class ExperienceViewController: UIViewController {

    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "experienceImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let selectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "What is your experience in weight training?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let beginnerBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Beginner", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let intermediateBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Intermediate", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let advancedBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Advanced", for: .normal)
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
        
        beginnerBtn.addTarget(self, action: #selector(goToBeginner), for: .touchUpInside)
        intermediateBtn.addTarget(self, action: #selector(goToIntermediate), for: .touchUpInside)
        advancedBtn.addTarget(self, action: #selector(goToAdvanced), for: .touchUpInside)
    }
    
    @objc func goToBeginner() {
        let data = UserDefaults.standard
        data.setValue("Beginner", forKey: "Experience")
        let vc = GoalViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToIntermediate() {
        let data = UserDefaults.standard
        data.setValue("Intermediate", forKey: "Experience")
        let vc = GoalViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToAdvanced() {
        let data = UserDefaults.standard
        data.setValue("Advanced", forKey: "Experience")
        let vc = GoalViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addComponents() {
        view.addSubview(coverImage)
        view.addSubview(selectLabel)
        view.addSubview(beginnerBtn)
        view.addSubview(intermediateBtn)
        view.addSubview(advancedBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450)
        ])
        
        NSLayoutConstraint.activate([
            selectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            selectLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 120),
        ])
        
        NSLayoutConstraint.activate([
            beginnerBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            beginnerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            beginnerBtn.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 20),
            beginnerBtn.heightAnchor.constraint(equalToConstant: 40),
            
            intermediateBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            intermediateBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            intermediateBtn.topAnchor.constraint(equalTo: beginnerBtn.bottomAnchor, constant: 20),
            intermediateBtn.heightAnchor.constraint(equalToConstant: 40),
            
            advancedBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            advancedBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            advancedBtn.topAnchor.constraint(equalTo: intermediateBtn.bottomAnchor, constant: 20),
            advancedBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
