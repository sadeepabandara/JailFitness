//
//  SingleExerciseViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-18.
//

import UIKit
import WebKit

class SingleExerciseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let exerciseLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 24)
        label.text = "Dumbell Curl"
        label.textColor = .white
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "Bigger is better than bigger. It’s all about the hard work you put in. Get ready to pump some iron!"
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    let setsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "How many sets?"
        label.textColor = .white
        return label
    }()
    
    let repsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "How many reps?"
        label.textColor = .white
        return label
    }()
    
    let weightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "How much weight?"
        label.textColor = .white
        return label
    }()
    
    let startBtn : UIButton = {
        let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Workout", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = customYellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return button
    }()
    
    var webView: WKWebView!
    
    let setsPickerView = UIPickerView()
    let setsTextField = UITextField()
    let setsCounts: [Int] = {
        var counts = [Int]()
        for count in 1...10 {
            counts.append(count)
        }
        return counts
    }()
    
    let repsPickerView = UIPickerView()
    let repsTextField = UITextField()
    let repsCounts: [Int] = {
        var counts = [Int]()
        for count in 1...20 {
            counts.append(count)
        }
        return counts
    }()
    
    let weightPickerView = UIPickerView()
    let weightTextField = UITextField()
    let weightSizes: [Int] = {
        var counts = [Int]()
        for count in 1...200 {
            counts.append(count)
        }
        return counts
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
                
        setsTextField.translatesAutoresizingMaskIntoConstraints = false
        setsTextField.textAlignment = .center
        setsTextField.backgroundColor = customBlueLight
        setsTextField.font = UIFont.systemFont(ofSize: 18)
        setsTextField.borderStyle = .roundedRect
        setsTextField.borderStyle = .roundedRect
        setsTextField.layer.shadowOpacity = 0.1
        setsTextField.layer.shadowColor = UIColor.gray.cgColor
        setsTextField.layer.shadowRadius = 1
        setsTextField.textColor = .white
        view.addSubview(setsTextField)
        
        repsTextField.translatesAutoresizingMaskIntoConstraints = false
        repsTextField.textAlignment = .center
        repsTextField.backgroundColor = customBlueLight
        repsTextField.font = UIFont.systemFont(ofSize: 18)
        repsTextField.borderStyle = .roundedRect
        repsTextField.borderStyle = .roundedRect
        repsTextField.layer.shadowOpacity = 0.1
        repsTextField.layer.shadowColor = UIColor.gray.cgColor
        repsTextField.layer.shadowRadius = 1
        repsTextField.textColor = .white
        view.addSubview(repsTextField)
        
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
        
        setsPickerView.delegate = self
        setsPickerView.dataSource = self
        setsTextField.inputView = setsPickerView
        setsPickerView.backgroundColor = customBlueLight
        
        repsPickerView.delegate = self
        repsPickerView.dataSource = self
        repsTextField.inputView = repsPickerView
        repsPickerView.backgroundColor = customBlueLight
        
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
        weightTextField.inputView = weightPickerView
        weightPickerView.backgroundColor = customBlueLight
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
        doneButton.tintColor = customYellow
        toolbar.barTintColor = customBlue
        
        setsTextField.inputAccessoryView = toolbar
        repsTextField.inputAccessoryView = toolbar
        weightTextField.inputAccessoryView = toolbar
        
        configureWebView()
        loadYouTubeVideo(videoId: "yTWO2th-RIY")
        
        addComponents()
        setupConstraints()
    }
    
    func addComponents() {
        view.addSubview(exerciseLabel)
        view.addSubview(descLabel)
        view.addSubview(setsLabel)
        view.addSubview(repsLabel)
        view.addSubview(weightLabel)
        view.addSubview(startBtn)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            exerciseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exerciseLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 15),
            exerciseLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descLabel.topAnchor.constraint(equalTo: exerciseLabel.bottomAnchor, constant: 5),
            
            setsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setsLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 15),
            
            setsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            setsTextField.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 10),
            setsTextField.widthAnchor.constraint(equalToConstant: 200),
            setsTextField.heightAnchor.constraint(equalToConstant: 40),
            
            repsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsLabel.topAnchor.constraint(equalTo: setsTextField.bottomAnchor, constant: 15),
            
            repsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsTextField.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 10),
            repsTextField.widthAnchor.constraint(equalToConstant: 200),
            repsTextField.heightAnchor.constraint(equalToConstant: 40),
            
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightLabel.topAnchor.constraint(equalTo: repsTextField.bottomAnchor, constant: 15),
            
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10),
            weightTextField.widthAnchor.constraint(equalToConstant: 200),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            startBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startBtn.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 20),
            startBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == setsPickerView {
            return setsCounts.count
        } else if pickerView == repsPickerView {
            return repsCounts.count
        } else if pickerView == weightPickerView {
            return weightSizes.count
        }
                
        return 0
    }
        
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        
        if pickerView == setsPickerView {
            let setsCount = setsCounts[row]
            let attributedString = NSAttributedString(string: "\(setsCount) sets", attributes: attributes)
            return attributedString
        } else if pickerView == repsPickerView {
            let repsCount = repsCounts[row]
            let attributedString = NSAttributedString(string: "\(repsCount) reps", attributes: attributes)
            return attributedString
        } else if pickerView == weightPickerView {
            let weightSize = weightSizes[row]
            let attributedString = NSAttributedString(string: "\(weightSize) kg", attributes: attributes)
            return attributedString
        }
            
        return nil
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == setsPickerView {
            let selectedSetsCount = setsCounts[row]
            setsTextField.text = "\(selectedSetsCount)"
        } else if pickerView == repsPickerView {
            let selectedRepsCount = repsCounts[row]
            repsTextField.text = "\(selectedRepsCount)"
        } else if pickerView == weightPickerView {
            let selectedWeightSize = weightSizes[row]
            weightTextField.text = "\(selectedWeightSize)"
        }
    }
        
    @objc func doneButtonTapped() {
        setsTextField.resignFirstResponder()
        repsTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }

    func configureWebView() {
        webView = WKWebView(frame: view.bounds)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -200),
            webView.heightAnchor.constraint(equalToConstant: 395),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5),
            webView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        webView.navigationDelegate = self
    }

    func loadYouTubeVideo(videoId: String) {
        let videoURL = "https://www.youtube.com/embed/\(videoId)"
        let htmlString = "<iframe width=\"980\" height=\"800\" src=\"\(videoURL)?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}

extension SingleExerciseViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    
    }
}
