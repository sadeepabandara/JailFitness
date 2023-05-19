//
//  MyPlanViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-04-14.
//

import UIKit

class MyPlanViewController: UIViewController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profileImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    let welcomeLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "Welcome Back!"
        label.textColor = customYellow
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.text = "Sadeepa Bandara"
        label.textColor = .white
        return label
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    let mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let todayLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 22)
        label.text = "Today's Activity"
        label.textColor = .white
        return label
    }()
    
    let images : [UIImage] = [
        UIImage(named: "dumbellCurl")!,
        UIImage(named: "barbellCurl")!,
        UIImage(named: "squat")!,
        UIImage(named: "cableCrossOver")!,
        UIImage(named: "oneArmRow")!,
    ]
    
    let desc : [String] = [
        "Dumbell Curl",
        "Barbell Curl",
        "Squat",
        "Cable Cross Over",
        "One Arm Row",
    ]
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
        tableView.allowsSelection = true
        tableView.register(MyPlanTableViewCell.self, forCellReuseIdentifier: MyPlanTableViewCell.identifier)
        tableView.separatorColor = UIColor.gray
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        let textColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textColor
        
        addComponents()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addComponents() {
        hStack.addArrangedSubview(profileImage)
        hStack.addArrangedSubview(vStack)
        vStack.addArrangedSubview(welcomeLabel)
        vStack.addArrangedSubview(nameLabel)
        mainView.addSubview(hStack)
        view.addSubview(mainView)
        
        view.addSubview(todayLabel)
        
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            profileImage.topAnchor.constraint(equalTo: mainView.topAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            welcomeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 10),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 70),
            
            todayLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            todayLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            todayLabel.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10),
            todayLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MyPlanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPlanTableViewCell.identifier, for: indexPath) as? MyPlanTableViewCell else {
            fatalError("The tableView could not dequeue a MyPlanTableViewCell in MyPlanViewController")
        }
        let image = images[indexPath.row]
        let desc = desc[indexPath.row]
        
        
        cell.configure(with: image, and: desc)
        cell.contentView.backgroundColor = customBlueLight
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToNext()
    }
    
    @objc func goToNext() {
        let vc = SingleExerciseViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
