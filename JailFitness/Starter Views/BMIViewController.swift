//
//  BMIViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-18.
//

import UIKit
import FirebaseFirestore

class BMIViewController: UIViewController {
    
    let db = Firestore.firestore()
        
    var BMI = 1.2;
    var bmiStr = ""

    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bmiImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let selectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Here is your BMI"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let bmiLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Under Weight"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = customYellow
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.sizeToFit()
        return label
    }()
    
    let goalLabel : UILabel = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Gain Weight"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = customYellow
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.sizeToFit()
        return label
    }()
    
    let startBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
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
        calculateBMI()
        
        startBtn.addTarget(self, action: #selector(goToTabBar), for: .touchUpInside)
    }
    
    func calculateBMI() {
        let data = UserDefaults.standard
        let weight = data.double(forKey: "Weight")
        let height = data.double(forKey: "Height")
        
//        print("Weight: ",weight, "Height: ", height)
        
        let bmi = (weight / height / height) * 10000
        
        let bmiDouble = Double(bmi)
        
        if(bmiDouble <= 18.5) {
            bmiLabel.text = "Underweight"
            goalLabel.text = "Gain Weight"
            bmiStr = "gain_weight"
        } else if (bmiDouble >= 18.5 && bmiDouble < 25) {
            bmiLabel.text = "Normal"
            goalLabel.text = "Gain Weight"
            bmiStr = "gain_weight"
        } else if (bmiDouble >= 25 && bmiDouble < 30) {
            bmiLabel.text = "Overweight"
            goalLabel.text = "Lose Weight"
            bmiStr = "lose_weight"
        } else {
            bmiLabel.text = "Obesity"
            goalLabel.text = "Lose Weight"
            bmiStr = "lose_weight"
        }
        
        data.set(bmiStr, forKey: "bmi")
    }
    
    func getDataFromUserDefaults(){
        let data = UserDefaults.standard
        
        let email = data.string(forKey: "Email")!
        let password = data.string(forKey: "Password")
        let gender = data.string(forKey: "Gender")
        let age = data.string(forKey: "Age")
        let weight = data.string(forKey: "Weight")!
        let height = data.string(forKey: "Height")
        let experience = data.string(forKey: "Experience")
        let goal = data.string(forKey: "Goal")
            
        saveData(email: email, password: password!, gender: gender!, age: age!, weight: weight, height: height!, experience: experience!, goal: goal!, bmiStr: bmiStr)
    }
        
    func saveData(email:String,password:String,gender:String,age:String,weight:String,height:String,experience:String,goal:String,bmiStr:String){
        let data: [String: Any] = [
            "email": email,
            "password" : password,
            "gender" : gender,
            "age" : age,
            "weight" : weight,
            "height" : height,
            "experience" : experience,
            "goal" : goal,
            "bmi" : bmiStr
        ]
        
        db.collection("/user_details").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added")
            }
        }
    }
    
    @objc func goToTabBar() {
        print("Hi sadeepa")
        getDataFromUserDefaults()
        
        tab()
        
    }
    
    func tab(){
        let tabBarVc = UITabBarController()
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ScheduleViewController())
        let vc3 = UINavigationController(rootViewController: ProgressViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        vc1.title = "Home"
        vc2.title = "Schedule"
        vc3.title = "Progress"
        vc4.title = "Profile"
        
        tabBarVc.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
        let blurEffect = UIBlurEffect(style: .dark)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = tabBarVc.tabBar.bounds
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            tabBarVc.tabBar.insertSubview(blurView, at: 0)
        
        guard let items = tabBarVc.tabBar.items else {
            return
        }
        
        let images = ["house.fill", "doc.plaintext.fill", "chart.bar.xaxis", "person.fill"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
            items[x].badgeColor = UIColor.white
        }
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = customYellow
        tabBarAppearance.unselectedItemTintColor = .white
        
        tabBarVc.modalPresentationStyle = .fullScreen
        present(tabBarVc, animated: true)
    }
    
    func addComponents() {
        view.addSubview(coverImage)
        view.addSubview(selectLabel)
        view.addSubview(bmiLabel)
        view.addSubview(goalLabel)
        view.addSubview(startBtn)
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
            bmiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bmiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bmiLabel.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 20),
            bmiLabel.heightAnchor.constraint(equalToConstant: 70),
            
            goalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goalLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 20),
            goalLabel.heightAnchor.constraint(equalToConstant: 70),
            
            startBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startBtn.topAnchor.constraint(equalTo: goalLabel.bottomAnchor, constant: 20),
            startBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
