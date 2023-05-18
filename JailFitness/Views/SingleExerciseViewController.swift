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
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
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
    
    
    var webView: WKWebView!
    
    let pickerView = UIPickerView()
    let textField = UITextField()
    let setsCounts: [Int] = {
        var counts = [Int]()
        for count in 1...20 {
            counts.append(count)
        }
        return counts
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
                
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.backgroundColor = customBlueLight
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = .roundedRect
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        textField.textColor = .white
        view.addSubview(textField)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
        pickerView.backgroundColor = customBlueLight
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
        doneButton.tintColor = customYellow
        toolbar.barTintColor = customBlue
        
        textField.inputAccessoryView = toolbar
        
        configureWebView()
        loadYouTubeVideo(videoId: "yTWO2th-RIY")
        
        addComponents()
        setupConstraints()
    }
    
    func addComponents() {
        view.addSubview(exerciseLabel)
        view.addSubview(descLabel)
        view.addSubview(setsLabel)
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
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 10),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return setsCounts.count
    }
        
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let setsCount = setsCounts[row]
        let attributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
                        
        let attributedString = NSAttributedString(string: "\(setsCount) sets", attributes: attributes)
                
        return attributedString
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedSetsCount = setsCounts[row]
        textField.text = "\(selectedSetsCount)"
    }
        
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
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
