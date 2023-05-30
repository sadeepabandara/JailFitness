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
    
    var startTime: Date?
    var timer: Timer?
    
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
    
    var videoId: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
        
        startBtn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
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
        loadYouTubeVideo(videoId: videoId)
        
        addComponents()
        setupConstraints()
    }
    
    var tabBarHeight: CGFloat = 0.0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
            if #available(iOS 11.0, *) {
                // Adjust the top anchor of the mainView to account for the tabBar height
                webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -tabBarHeight).isActive = true
            } else {
                // Adjust the top anchor of the mainView to account for the tabBar height
                webView.topAnchor.constraint(equalTo: view.topAnchor, constant: -tabBarHeight).isActive = true
            }
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
            startBtn.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 40),
            startBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    let stopwatchLabel = UILabel()
    
    func showPopup() {
        let popup = UIView()
        popup.translatesAutoresizingMaskIntoConstraints = false
        popup.backgroundColor = .systemGray5
        popup.layer.cornerRadius = 10
        popup.layer.shadowColor = UIColor.gray.cgColor
        popup.layer.shadowOpacity = 0.2
        popup.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        
        stopwatchLabel.translatesAutoresizingMaskIntoConstraints = false
        stopwatchLabel.font = UIFont(name: "Poppins-Bold", size: 36)
        stopwatchLabel.textColor = customBlue
        stopwatchLabel.text = "00:00:00"
        
        let startStopwatchButton = UIButton()
        startStopwatchButton.translatesAutoresizingMaskIntoConstraints = false
        startStopwatchButton.setTitle("Start", for: .normal)
        startStopwatchButton.backgroundColor = customYellow
        startStopwatchButton.setTitleColor(.black, for: .normal)
        startStopwatchButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        startStopwatchButton.layer.cornerRadius = 10
        startStopwatchButton.addTarget(self, action: #selector(startStopwatch), for: .touchUpInside)

        
        let finishStopwatchButton = UIButton()
        finishStopwatchButton.translatesAutoresizingMaskIntoConstraints = false
        finishStopwatchButton.setTitle("Stop", for: .normal)
        finishStopwatchButton.backgroundColor = customYellow
        finishStopwatchButton.setTitleColor(.black, for: .normal)
        finishStopwatchButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        finishStopwatchButton.layer.cornerRadius = 10
        finishStopwatchButton.addTarget(self, action: #selector(resetStopwatch), for: .touchUpInside)
            
        
        popup.addSubview(stopwatchLabel)
        popup.addSubview(startStopwatchButton)
        popup.addSubview(finishStopwatchButton)
        
        view.addSubview(popup)
        
        NSLayoutConstraint.activate([
            popup.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popup.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popup.widthAnchor.constraint(equalToConstant: 300),
            popup.heightAnchor.constraint(equalToConstant: 250),
            
            stopwatchLabel.centerXAnchor.constraint(equalTo: popup.centerXAnchor),
            stopwatchLabel.topAnchor.constraint(equalTo: popup.topAnchor, constant: 20),
            
            startStopwatchButton.centerXAnchor.constraint(equalTo: popup.centerXAnchor),
            startStopwatchButton.topAnchor.constraint(equalTo: stopwatchLabel.bottomAnchor, constant: 20),
            startStopwatchButton.widthAnchor.constraint(equalToConstant: 120),
            startStopwatchButton.heightAnchor.constraint(equalToConstant: 40),
            
            finishStopwatchButton.centerXAnchor.constraint(equalTo: popup.centerXAnchor),
            finishStopwatchButton.topAnchor.constraint(equalTo: startStopwatchButton.bottomAnchor, constant: 20),
            finishStopwatchButton.widthAnchor.constraint(equalToConstant: 120),
            finishStopwatchButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func startStopwatch() {
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateStopwatch), userInfo: nil, repeats: true)
    }
    
    @objc func resetStopwatch() {
        timer?.invalidate()
        timer = nil
        startTime = nil
        stopwatchLabel.text = "00:00:00"
        view.subviews.last?.removeFromSuperview()
    }
        
    @objc func updateStopwatch() {
        guard let startTime = startTime else { return }
        let currentTime = Date()
        let elapsedTime = currentTime.timeIntervalSince(startTime)
            
        let hours = Int(elapsedTime / 3600)
        let minutes = Int((elapsedTime.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
            
        let formattedTime = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        stopwatchLabel.text = formattedTime
    }
    
    var errorLabel: UILabel?
    
    @objc func startButtonTapped() {
        if let setsTextField = setsTextField.text, setsTextField.isEmpty {
            displayErrorMessage("Missing sets - Please enter your sets count")
        } else if let repsTextField = repsTextField.text,
            repsTextField.isEmpty {
            displayErrorMessage("Missing reps - Please enter your reps count")
        } else if let weightTextField = weightTextField.text, weightTextField.isEmpty {
            displayErrorMessage("Missing weight - Please enter your weight size")
        } else {
            errorLabel?.removeFromSuperview()
            showPopup()
        }
    }
    
    func displayErrorMessage(_ message: String) {
        errorLabel?.removeFromSuperview()
        
        let errorLabel = UILabel()
        let customOrange = UIColor(red: 249.0/255.0, green: 155.0/255.0, blue: 125.0/255.0, alpha: 1)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        errorLabel.textColor = customOrange
        errorLabel.textAlignment = .center
        errorLabel.text = message
        
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 5)
        ])
        
        self.errorLabel = errorLabel
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
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -290),
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
