//
//  ExerciseViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-03-31.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    
    let exercisesTableView: UITableView = {
        let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = customBlue
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        title = "Exercises"
        
        addExercises()
        addComponents()
        setDelegates()
        setupConstraints()
        exercisesTableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func addExercises() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddExercises))
    }
    
    @objc func goToAddExercises() {
        let vc = AddExercisesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addComponents() {
        view.addSubview(exercisesTableView)
    }
    
    func setDelegates() {
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            exercisesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exercisesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            exercisesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            exercisesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExerciseTableViewCell
        cell.contentView.backgroundColor = customBlue
        return cell
    }
}
