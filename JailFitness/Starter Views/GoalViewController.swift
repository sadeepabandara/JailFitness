//
//  GoalViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-17.
//

import UIKit

class GoalViewController: UIViewController {

    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "goalImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let selectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "What is your gym goal?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let gainWeightBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Gain Weight", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let loseWeightBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Lose Weight", for: .normal)
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
        
        gainWeightBtn.addTarget(self, action: #selector(goToGain), for: .touchUpInside)
        loseWeightBtn.addTarget(self, action: #selector(goToLose), for: .touchUpInside)
    }
    
    @objc func goToGain() {
        let data = UserDefaults.standard
        data.setValue("Gain Weight", forKey: "Goal")
        
        let vc = BMIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToLose() {
        let data = UserDefaults.standard
        data.setValue("Lose Weight", forKey: "Goal")
        
        let vc = BMIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addComponents() {
        view.addSubview(coverImage)
        view.addSubview(selectLabel)
        view.addSubview(gainWeightBtn)
        view.addSubview(loseWeightBtn)
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
            gainWeightBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gainWeightBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gainWeightBtn.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 20),
            gainWeightBtn.heightAnchor.constraint(equalToConstant: 40),
            
            loseWeightBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loseWeightBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loseWeightBtn.topAnchor.constraint(equalTo: gainWeightBtn.bottomAnchor, constant: 20),
            loseWeightBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
