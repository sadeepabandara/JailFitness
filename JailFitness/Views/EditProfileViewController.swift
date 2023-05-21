//
//  EditProfileViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-21.
//

import UIKit

class EditProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "weightImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "Update age?"
        label.textColor = .white
        return label
    }()
    
    let weightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "Update weight?"
        label.textColor = .white
        return label
    }()
    
    let heightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "Update height?"
        label.textColor = .white
        return label
    }()
    
    let updateBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    let agePickerView = UIPickerView()
    let ageTextField = UITextField()
    let ageCount: [Int] = {
        var counts = [Int]()
        for count in 6...100 {
            counts.append(count)
        }
        return counts
    }()
    
    let weightPickerView = UIPickerView()
    let weightTextField = UITextField()
    let weightSize: [Int] = {
        var counts = [Int]()
        for count in 40...150 {
            counts.append(count)
        }
        return counts
    }()
    
    let heightPickerView = UIPickerView()
    let heightTextField = UITextField()
    let heightSize: [Int] = {
        var counts = [Int]()
        for count in 120...220 {
            counts.append(count)
        }
        return counts
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
        
        updateBtn.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.textAlignment = .center
        ageTextField.backgroundColor = customBlueLight
        ageTextField.font = UIFont.systemFont(ofSize: 18)
        ageTextField.borderStyle = .roundedRect
        ageTextField.borderStyle = .roundedRect
        ageTextField.layer.shadowOpacity = 0.1
        ageTextField.layer.shadowColor = UIColor.gray.cgColor
        ageTextField.layer.shadowRadius = 1
        ageTextField.textColor = .white
        view.addSubview(ageTextField)
        
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.textAlignment = .center
        weightTextField.backgroundColor = customBlueLight
        weightTextField.font = UIFont.systemFont(ofSize: 18)
        weightTextField.borderStyle = .roundedRect
        weightTextField.borderStyle = .roundedRect
        weightTextField.layer.shadowOpacity = 0.1
        weightTextField.layer.shadowColor = UIColor.gray.cgColor
        weightTextField.layer.shadowRadius = 1
        weightTextField.textColor = .white
        view.addSubview(weightTextField)
        
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.textAlignment = .center
        heightTextField.backgroundColor = customBlueLight
        heightTextField.font = UIFont.systemFont(ofSize: 18)
        heightTextField.borderStyle = .roundedRect
        heightTextField.borderStyle = .roundedRect
        heightTextField.layer.shadowOpacity = 0.1
        heightTextField.layer.shadowColor = UIColor.gray.cgColor
        heightTextField.layer.shadowRadius = 1
        heightTextField.textColor = .white
        view.addSubview(heightTextField)
        
        agePickerView.delegate = self
        agePickerView.dataSource = self
        ageTextField.inputView = agePickerView
        agePickerView.backgroundColor = customBlueLight
        
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
        weightTextField.inputView = weightPickerView
        weightPickerView.backgroundColor = customBlueLight
        
        heightPickerView.delegate = self
        heightPickerView.dataSource = self
        heightTextField.inputView = heightPickerView
        heightPickerView.backgroundColor = customBlueLight
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
        doneButton.tintColor = customYellow
        toolbar.barTintColor = customBlue
        
        ageTextField.inputAccessoryView = toolbar
        weightTextField.inputAccessoryView = toolbar
        heightTextField.inputAccessoryView = toolbar
        
        addComponents()
        setupConstraints()
    }
    
    func addComponents() {
        view.addSubview(coverImage)
        view.addSubview(ageLabel)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
        view.addSubview(updateBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -700),

            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 230),
            
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            ageTextField.widthAnchor.constraint(equalToConstant: 200),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 15),
            
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10),
            weightTextField.widthAnchor.constraint(equalToConstant: 200),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 15),
            
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
            heightTextField.widthAnchor.constraint(equalToConstant: 200),
            heightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            updateBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            updateBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            updateBtn.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 40),
            updateBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func updateButtonTapped() {
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePickerView {
            return ageCount.count
        } else if pickerView == weightPickerView {
            return weightSize.count
        } else if pickerView == heightPickerView {
            return heightSize.count
        }
                
        return 0
    }
        
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        
        if pickerView == agePickerView {
            let ageCount = ageCount[row]
            let attributedString = NSAttributedString(string: "\(ageCount) Yrs", attributes: attributes)
            return attributedString
        } else if pickerView == weightPickerView {
            let weightSize = weightSize[row]
            let attributedString = NSAttributedString(string: "\(weightSize) Kg", attributes: attributes)
            return attributedString
        } else if pickerView == heightPickerView {
            let heightSize = heightSize[row]
            let attributedString = NSAttributedString(string: "\(heightSize) Cm", attributes: attributes)
            return attributedString
        }
            
        return nil
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePickerView {
            let selectedAgeCount = ageCount[row]
            ageTextField.text = "\(selectedAgeCount)"
        } else if pickerView == weightPickerView {
            let selectedWeightSize = weightSize[row]
            weightTextField.text = "\(selectedWeightSize)"
        } else if pickerView == heightPickerView {
            let selectedHeightSize = heightSize[row]
            heightTextField.text = "\(selectedHeightSize)"
        }
    }
        
    @objc func doneButtonTapped() {
        ageTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
    }
}
