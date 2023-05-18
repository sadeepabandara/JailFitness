//
//  AddExercisesViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-04-14.
//

import UIKit

class AddExercisesViewController: UIViewController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    
    let addImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "camera.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let exerciseLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Exercise Name"
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        label.textColor = .white
        return label
    }()
    
    let exerciseText : UITextField = {
        let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 1
        textField.keyboardType = .default
        textField.backgroundColor = customBlueLight
        textField.text = nil
        textField.attributedPlaceholder = NSAttributedString(
            string: "My Exercise...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.font = UIFont(name: "Poppins-Regular", size: 16)
        textField.textColor = .white
        textField.becomeFirstResponder()
        return textField
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        title = "Create Exercise"
        let textColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textColor
        
        addComponents()
        setupConstraints()
        doneExerciseCreation()
        
        tapGasture()
    }
    
    func doneExerciseCreation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goToExercise))
    }
    
    @objc func goToExercise() {

    }
    
    func tapGasture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        addImage.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
        
    @objc func imageTapped(gesture: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
        print("Click Tap")
    }
    
    func addComponents() {
        hStack.addArrangedSubview(addImage)
        hStack.addArrangedSubview(vStack)
        vStack.addArrangedSubview(exerciseLabel)
        vStack.addArrangedSubview(exerciseText)
        mainView.addSubview(hStack)
        view.addSubview(mainView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            addImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -320),
            addImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            addImage.heightAnchor.constraint(equalToConstant: 50),
            
            exerciseLabel.leadingAnchor.constraint(equalTo: addImage.trailingAnchor, constant: 10),
            exerciseLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            exerciseLabel.topAnchor.constraint(equalTo: mainView.topAnchor),
            exerciseLabel.heightAnchor.constraint(equalToConstant: 40),
        
            exerciseText.leadingAnchor.constraint(equalTo: addImage.trailingAnchor, constant: 10),
            exerciseText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            exerciseText.topAnchor.constraint(equalTo: exerciseLabel.bottomAnchor, constant: 40),
            exerciseText.heightAnchor.constraint(equalToConstant: 40),
            
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension AddExercisesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        addImage.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}
