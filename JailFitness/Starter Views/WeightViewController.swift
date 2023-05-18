//
//  WeightViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-17.
//

import UIKit

class WeightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        let pickerView = UIPickerView()
        let textField = UITextField()
        let weights: [Int] = {
                var weights = [Int]()
                for kg in 40...150 {
                    weights.append(kg)
                }
                return weights
    }()
    
    var errorLabel: UILabel?
        
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    let customOrange = UIColor(red: 249.0/255.0, green: 155.0/255.0, blue: 125.0/255.0, alpha: 1)
        
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "weightImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
        
    let selectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "What is your weight?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
        
    let nextBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
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
            
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.backgroundColor = customBlueLight
        textField.font = UIFont(name: "Poppins-Medium", size: 18)
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        textField.textColor = .white
        view.addSubview(textField)
            
        view.addSubview(coverImage)
        view.addSubview(selectLabel)
        view.addSubview(nextBtn)
            
        setupConstraints()
            
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = customBlueLight
            
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
        doneButton.tintColor = customYellow
        toolbar.barTintColor = customBlue
            
        textField.inputAccessoryView = toolbar
            
        nextBtn.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
        textField.addGestureRecognizer(tapGesture)
    }
        
    @objc func goToNext() {
        let data = UserDefaults.standard
        let weight = textField.text!
        let dWeight = Double(weight)
        
        data.setValue(dWeight, forKey: "Weight")
        
        if let weightText = textField.text, !weightText.isEmpty {
            navigateToNextPage()
            errorLabel?.removeFromSuperview()
        } else {
            displayErrorMessage("Missing weight - Please enter your weight")
        }
    }
    
    func navigateToNextPage() {
        let vc = ExperienceViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func displayErrorMessage(_ message: String) {
        errorLabel?.removeFromSuperview()
        
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        errorLabel.textColor = customOrange
        errorLabel.textAlignment = .center
        errorLabel.text = message
        
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: nextBtn.bottomAnchor, constant: 10)
        ])
        
        self.errorLabel = errorLabel
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
                
            selectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 120),
                
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 20),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40),
                
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextBtn.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            nextBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weights.count
    }
        
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let weight = weights[row]
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
                    
        let attributedString = NSAttributedString(string: "\(weight) kg", attributes: attributes)
            
        return attributedString
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedWeight = weights[row]
        textField.text = "\(selectedWeight)"
    }
        
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
    }
        
    @objc func textFieldTapped() {
        textField.inputView = pickerView
        textField.becomeFirstResponder()
    }

}
