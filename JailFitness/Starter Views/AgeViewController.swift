//
//  AgeViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-17.
//

import UIKit

class AgeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let datePicker = UIPickerView()
    let textField = UITextField()
    
    var years: [Int] = []
    var months: [String] = []
    var days: [Int] = []
    
    var errorLabel: UILabel?
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    let customOrange = UIColor(red: 249.0/255.0, green: 155.0/255.0, blue: 125.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ageImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let selectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "What is your age?"
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
        
        view = UIView()
        view.backgroundColor = customBlue
        
        navigationController?.navigationBar.tintColor = customYellow
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.textColor = .white
        textField.backgroundColor = customBlueLight
        textField.font = UIFont(name: "Poppins-Medium", size: 18)
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        view.addSubview(textField)
        
        view.addSubview(coverImage)
        view.addSubview(selectLabel)
        view.addSubview(nextBtn)
        
        setupConstraints()
        
        datePicker.delegate = self
        datePicker.dataSource = self
        datePicker.backgroundColor = customBlueLight
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = customYellow
        toolbar.barTintColor = customBlue
        toolbar.setItems([doneButton], animated: true)
        
        textField.inputView = datePicker
        textField.inputAccessoryView = toolbar
        
        nextBtn.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        
        setupDatePickerData()
    }
    
    @objc func goToNext() {
        let data = UserDefaults.standard
        let age = textField.text
        data.setValue(age, forKey: "Age")
        
        if let ageText = textField.text, !ageText.isEmpty {
            let age = Int(ageText) ?? 0
            if age <= 5 {
                displayErrorMessage("Set a valid age")
            } else {
                navigateToNextPage()
                errorLabel?.removeFromSuperview()
            }
        } else {
            displayErrorMessage("Missing age - Please enter your age")
        }
    }
    
    func navigateToNextPage() {
        let vc = HeightViewController()
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
    
    func setupDatePickerData() {
        // Generate years (from current year to 1900)
        let currentYear = Calendar.current.component(.year, from: Date())
        for year in (1900...currentYear).reversed() {
            years.append(year)
        }
        
        // Generate months
        let dateFormatter = DateFormatter()
        months = dateFormatter.monthSymbols ?? []
        
        // Generate days (1 to 31)
        for day in 1...31 {
            days.append(day)
        }
        
        // Select default date
        let currentDate = Date()
        let calendar = Calendar.current
        let selectedYear = calendar.component(.year, from: currentDate)
        let selectedMonth = calendar.component(.month, from: currentDate)
        let selectedDay = calendar.component(.day, from: currentDate)
        
        let yearRow = years.firstIndex(of: selectedYear) ?? 0
        let monthRow = selectedMonth - 1
        let dayRow = selectedDay - 1
        
        datePicker.selectRow(yearRow, inComponent: 0, animated: false)
        datePicker.selectRow(monthRow, inComponent: 1, animated: false)
        datePicker.selectRow(dayRow, inComponent: 2, animated: false)
    }
    
    // MARK: - UIPickerViewDelegate & UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3 // Year, Month, Day
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return years.count
        } else if component == 1 {
            return months.count
        } else {
            return days.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title: String
        
        if component == 0 {
            title = "\(years[row])"
        } else if component == 1 {
            title = months[row]
        } else {
            title = "\(days[row])"
        }
        
        let color: UIColor
        switch component {
        case 0:
            color = .white
        case 1:
            color = .white
        case 2:
            color = .white
        default:
            color = .white
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        let year = years[pickerView.selectedRow(inComponent: 0)]
        //        let month = months[pickerView.selectedRow(inComponent: 1)]
        //        let day = days[pickerView.selectedRow(inComponent: 2)]
        //
        //        textField.text = "\(month) \(day), \(year)"
        
        //        let selectedYear = years[pickerView.selectedRow(inComponent: 0)]
        //        let currentYear = Calendar.current.component(.year, from: Date())
        //        let age = currentYear - selectedYear
        //
        //        textField.text = "\(age) years"
        
        let selectedYear = years[pickerView.selectedRow(inComponent: 0)]
        let selectedMonth = pickerView.selectedRow(inComponent: 1) + 1
        let selectedDay = pickerView.selectedRow(inComponent: 2) + 1
        
        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        
        let yearDifference = currentYear - selectedYear
        
        if currentMonth < selectedMonth || (currentMonth == selectedMonth && currentDay < selectedDay) {
            textField.text = "\(yearDifference - 1)"
        } else {
            textField.text = "\(yearDifference)"
        }
    }
    
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
    }
}
