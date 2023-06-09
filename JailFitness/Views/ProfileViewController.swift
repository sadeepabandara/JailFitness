//
//  SettingsViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-04-14.
//

import UIKit
import Firebase
import FirebaseFirestore

class ProfileViewController: UIViewController {
    
    let db = Firestore.firestore()
        
    var name:String = "Sadeepa Bandara"
    var age:String = "22"
    var weight:String = "74"
    var height:String = "183"
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profileImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 60
        return imageView
    }()
    
    let userLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "Sadeepa"
        label.textColor = .white
        return label
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "sadeepa@gmail.com"
        label.textColor = .white
        return label
    }()
    
    let ageLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "Age"
        label.textColor = customYellow
        label.textAlignment = .center
        return label
    }()
    
    let ageNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "22 Yrs"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let weightLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "Weight"
        label.textColor = customYellow
        label.textAlignment = .center
        return label
    }()
    
    let weightNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "102 Kg"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let heightLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "Height"
        label.textColor = customYellow
        label.textAlignment = .center
        return label
    }()
    
    let heightNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "142 Cm"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    let vStack1 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        return stack
    }()
    
    let vStack2 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        return stack
    }()
    
    let vStack3 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        return stack
    }()
    
    let mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let editProfileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let editProfileLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.text = "Edit Profile"
        label.textColor = .systemGray4
        return label
    }()
    
    let nextBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = customYellow
        return button
    }()
    
    let hStack2 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        stack.spacing = 40
        return stack
    }()
    
    let mainView2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notificationImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let notificationLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.text = "Notifications"
        label.textColor = .systemGray4
        return label
    }()
    
    let nextBtn2 : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = customYellow
        return button
    }()
    
    let hStack3 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        stack.spacing = 40
        return stack
    }()
    
    let mainView3 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let settingsImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "gearshape")
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let settingsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.text = "Settings"
        label.textColor = .systemGray4
        return label
    }()
    
    let nextBtn3 : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = customYellow
        return button
    }()
    
    let hStack4 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        stack.spacing = 40
        return stack
    }()
    
    let mainView4 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoutImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let logoutLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.text = "Logout"
        label.textColor = .systemGray4
        return label
    }()
    
    let nextBtn4 : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = customYellow
        return button
    }()
    
    let hStack5 : UIStackView = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = customBlueLight
        stack.layer.masksToBounds = true
        stack.layer.cornerRadius = 10
        stack.spacing = 40
        return stack
    }()
    
    let mainView5 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
        
    let popupLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 18)
        label.text = "Are you sure?"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
        
    let yesButton: UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.setTitle("Yes", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = customYellow
        button.layer.cornerRadius = 8
        return button
    }()
        
    let noButton: UIButton = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.setTitle("No", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = customBlueLight
        button.layer.cornerRadius = 8
        return button
    }()
    
    @objc func showPopup() {
        let popupHeight: CGFloat = 200
        let popupWidth: CGFloat = 280
            
        view.addSubview(popupView)
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: popupWidth),
            popupView.heightAnchor.constraint(equalToConstant: popupHeight)
        ])
            
        popupView.addSubview(popupLabel)
        popupView.addSubview(yesButton)
        popupView.addSubview(noButton)
            
        NSLayoutConstraint.activate([
            popupLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 20),
            popupLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            popupLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20)
        ])
            
        NSLayoutConstraint.activate([
            yesButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -20),
            yesButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20),
            yesButton.widthAnchor.constraint(equalToConstant: 80),
            yesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
            
        NSLayoutConstraint.activate([
            noButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -20),
            noButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20),
            noButton.widthAnchor.constraint(equalToConstant: 80),
            noButton.heightAnchor.constraint(equalToConstant: 40)
        ])
            
        yesButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(dismissPopup), for: .touchUpInside)
    }
        
    @objc func dismissPopup() {
        popupView.removeFromSuperview()
    }
    
    func handleAuthentication() {
        if Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: ViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
        
    @objc func goToLogin() {
        try? Auth.auth().signOut()
        handleAuthentication()
//        let vc = LoginViewController()
//        vc.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(vc, animated: true)
//        popupView.removeFromSuperview()
    }
    
    @objc func goToEdit() {
        let vc = EditProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        let textColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textColor
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        

        
        addComponents()
        setupConstraints()
        
        nextBtn.addTarget(self, action: #selector(goToEdit), for: .touchUpInside)
        
        nextBtn4.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
    }
    
    var tabBarHeight: CGFloat = 0.0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
            if #available(iOS 11.0, *) {
                // Adjust the top anchor of the mainView to account for the tabBar height
                profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -tabBarHeight).isActive = true
            } else {
                // Adjust the top anchor of the mainView to account for the tabBar height
                profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -tabBarHeight).isActive = true
            }
    }
    
    func addComponents() {
        view.addSubview(profileImage)
        view.addSubview(userLabel)
        view.addSubview(emailLabel)
        
        hStack.addArrangedSubview(vStack1)
        hStack.addArrangedSubview(vStack2)
        hStack.addArrangedSubview(vStack3)
        vStack1.addArrangedSubview(ageLabel)
        vStack1.addArrangedSubview(ageNumberLabel)
        vStack2.addArrangedSubview(weightLabel)
        vStack2.addArrangedSubview(weightNumberLabel)
        vStack3.addArrangedSubview(heightLabel)
        vStack3.addArrangedSubview(heightNumberLabel)
        mainView.addSubview(hStack)
        view.addSubview(mainView)
        
        hStack2.addArrangedSubview(editProfileImage)
        hStack2.addArrangedSubview(editProfileLabel)
        hStack2.addArrangedSubview(nextBtn)
        mainView2.addSubview(hStack2)
        view.addSubview(mainView2)
        
        hStack3.addArrangedSubview(notificationImage)
        hStack3.addArrangedSubview(notificationLabel)
        hStack3.addArrangedSubview(nextBtn2)
        mainView3.addSubview(hStack3)
        view.addSubview(mainView3)
        
        hStack4.addArrangedSubview(settingsImage)
        hStack4.addArrangedSubview(settingsLabel)
        hStack4.addArrangedSubview(nextBtn3)
        mainView4.addSubview(hStack4)
        view.addSubview(mainView4)
    
        hStack5.addArrangedSubview(logoutImage)
        hStack5.addArrangedSubview(logoutLabel)
        hStack5.addArrangedSubview(nextBtn4)
        mainView5.addSubview(hStack5)
        view.addSubview(mainView5)
    }
    
    func getUserDataFirebase() {
            
        let data = UserDefaults.standard
        
        let email = data.string(forKey: "Email")
            
        let userRef = db.collection("user_details")
        let query = userRef.whereField("email", isEqualTo: email as Any)

        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                    return
            }

            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }

            if let userDocument = documents.first {
                let name = userDocument.data()["email"] as? String ?? ""
                let age = userDocument.data()["age"] as? String ?? ""
                let weight = userDocument.data()["weight"] as? String ?? ""
                let height = userDocument.data()["height"] as? String ?? ""
                
                self.name = name
                self.age = age
                self.weight = weight
                self.height = height
                    
                self.userLabel.text = self.name
                self.ageNumberLabel.text = self.age
                self.weightNumberLabel.text = self.weight
                self.heightNumberLabel.text = self.height
            }
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15),
            userLabel.heightAnchor.constraint(equalToConstant: 20),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            emailLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            vStack1.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            vStack1.topAnchor.constraint(equalTo: hStack.topAnchor),
            vStack1.bottomAnchor.constraint(equalTo: hStack.bottomAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: vStack1.topAnchor, constant: 10),
            ageLabel.bottomAnchor.constraint(equalTo: ageNumberLabel.topAnchor, constant: 10),
                
            vStack2.leadingAnchor.constraint(equalTo: vStack1.trailingAnchor, constant: 10),
            vStack2.topAnchor.constraint(equalTo: hStack.topAnchor),
            vStack2.widthAnchor.constraint(equalTo: vStack1.widthAnchor),
            vStack2.bottomAnchor.constraint(equalTo: hStack.bottomAnchor),
            
            weightLabel.topAnchor.constraint(equalTo: vStack2.topAnchor, constant: 10),
            weightLabel.bottomAnchor.constraint(equalTo: weightNumberLabel.topAnchor, constant: 10),

                
            vStack3.leadingAnchor.constraint(equalTo: vStack2.trailingAnchor, constant: 10),
            vStack3.topAnchor.constraint(equalTo: hStack.topAnchor),
            vStack3.widthAnchor.constraint(equalTo: vStack1.widthAnchor),
            vStack3.trailingAnchor.constraint(equalTo: hStack.trailingAnchor),
            vStack3.bottomAnchor.constraint(equalTo: hStack.bottomAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: vStack1.topAnchor, constant: 10),
            heightLabel.bottomAnchor.constraint(equalTo: heightNumberLabel.topAnchor, constant: 10),
                
            hStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            hStack.topAnchor.constraint(equalTo: mainView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
                
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            mainView.heightAnchor.constraint(equalToConstant: 70),
        ])
        
        NSLayoutConstraint.activate([
            editProfileImage.leadingAnchor.constraint(equalTo: hStack2.leadingAnchor, constant: 20),
            editProfileImage.centerYAnchor.constraint(equalTo: mainView2.centerYAnchor),
            editProfileImage.widthAnchor.constraint(equalToConstant: 30),
            editProfileImage.heightAnchor.constraint(equalToConstant: 30),
            
            editProfileLabel.leadingAnchor.constraint(equalTo: editProfileImage.trailingAnchor, constant: 80),
            editProfileLabel.centerYAnchor.constraint(equalTo: mainView2.centerYAnchor),
            
            nextBtn.trailingAnchor.constraint(equalTo: mainView2.trailingAnchor, constant: -20),
            nextBtn.centerYAnchor.constraint(equalTo: mainView2.centerYAnchor),
            nextBtn.widthAnchor.constraint(equalToConstant: 30),
            nextBtn.heightAnchor.constraint(equalToConstant: 30),
            
        
            hStack2.leadingAnchor.constraint(equalTo: mainView2.leadingAnchor),
            hStack2.trailingAnchor.constraint(equalTo: mainView2.trailingAnchor),
            hStack2.topAnchor.constraint(equalTo: mainView2.topAnchor),
            hStack2.bottomAnchor.constraint(equalTo: mainView2.bottomAnchor),
            
            mainView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView2.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 15),
            mainView2.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            notificationImage.leadingAnchor.constraint(equalTo: hStack3.leadingAnchor, constant: 20),
            notificationImage.centerYAnchor.constraint(equalTo: mainView3.centerYAnchor),
            notificationImage.widthAnchor.constraint(equalToConstant: 30),
            notificationImage.heightAnchor.constraint(equalToConstant: 30),
            
            notificationLabel.leadingAnchor.constraint(equalTo: notificationImage.trailingAnchor, constant: 80),
            notificationLabel.centerYAnchor.constraint(equalTo: mainView3.centerYAnchor),
            
            nextBtn2.trailingAnchor.constraint(equalTo: mainView3.trailingAnchor, constant: -20),
            nextBtn2.centerYAnchor.constraint(equalTo: mainView3.centerYAnchor),
            nextBtn2.widthAnchor.constraint(equalToConstant: 30),
            nextBtn2.heightAnchor.constraint(equalToConstant: 30),
            
        
            hStack3.leadingAnchor.constraint(equalTo: mainView3.leadingAnchor),
            hStack3.trailingAnchor.constraint(equalTo: mainView3.trailingAnchor),
            hStack3.topAnchor.constraint(equalTo: mainView3.topAnchor),
            hStack3.bottomAnchor.constraint(equalTo: mainView3.bottomAnchor),
            
            mainView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView3.topAnchor.constraint(equalTo: mainView2.bottomAnchor, constant: 15),
            mainView3.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            settingsImage.leadingAnchor.constraint(equalTo: hStack4.leadingAnchor, constant: 20),
            settingsImage.centerYAnchor.constraint(equalTo: mainView4.centerYAnchor),
            settingsImage.widthAnchor.constraint(equalToConstant: 30),
            settingsImage.heightAnchor.constraint(equalToConstant: 30),
            
            settingsLabel.leadingAnchor.constraint(equalTo: settingsImage.trailingAnchor, constant: 80),
            settingsLabel.centerYAnchor.constraint(equalTo: mainView4.centerYAnchor),
            
            nextBtn3.trailingAnchor.constraint(equalTo: mainView4.trailingAnchor, constant: -20),
            nextBtn3.centerYAnchor.constraint(equalTo: mainView4.centerYAnchor),
            nextBtn3.widthAnchor.constraint(equalToConstant: 30),
            nextBtn3.heightAnchor.constraint(equalToConstant: 30),
            
        
            hStack4.leadingAnchor.constraint(equalTo: mainView4.leadingAnchor),
            hStack4.trailingAnchor.constraint(equalTo: mainView4.trailingAnchor),
            hStack4.topAnchor.constraint(equalTo: mainView4.topAnchor),
            hStack4.bottomAnchor.constraint(equalTo: mainView4.bottomAnchor),
            
            mainView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView4.topAnchor.constraint(equalTo: mainView3.bottomAnchor, constant: 15),
            mainView4.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            logoutImage.leadingAnchor.constraint(equalTo: hStack5.leadingAnchor, constant: 20),
            logoutImage.centerYAnchor.constraint(equalTo: mainView5.centerYAnchor),
            logoutImage.widthAnchor.constraint(equalToConstant: 30),
            logoutImage.heightAnchor.constraint(equalToConstant: 30),
            
            logoutLabel.leadingAnchor.constraint(equalTo: logoutImage.trailingAnchor, constant: 80),
            logoutLabel.centerYAnchor.constraint(equalTo: mainView5.centerYAnchor),
            
            nextBtn4.trailingAnchor.constraint(equalTo: mainView5.trailingAnchor, constant: -20),
            nextBtn4.centerYAnchor.constraint(equalTo: mainView5.centerYAnchor),
            nextBtn4.widthAnchor.constraint(equalToConstant: 30),
            nextBtn4.heightAnchor.constraint(equalToConstant: 30),
            
        
            hStack5.leadingAnchor.constraint(equalTo: mainView5.leadingAnchor),
            hStack5.trailingAnchor.constraint(equalTo: mainView5.trailingAnchor),
            hStack5.topAnchor.constraint(equalTo: mainView5.topAnchor),
            hStack5.bottomAnchor.constraint(equalTo: mainView5.bottomAnchor),
            
            mainView5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainView5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainView5.topAnchor.constraint(equalTo: mainView4.bottomAnchor, constant: 15),
            mainView5.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}

