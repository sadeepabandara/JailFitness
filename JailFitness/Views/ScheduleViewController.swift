//
//  WorkoutViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-04-14.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "scheduleImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let scheduleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.text = "Weekly Schedule"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let subScheduleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .systemGray3
        label.text = "There cannot be a crisis next week. My schedule is already full."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let images : [UIImage] = [
        UIImage(named: "monImage")!,
        UIImage(named: "tueImage")!,
        UIImage(named: "wedImage")!,
        UIImage(named: "thuImage")!,
        UIImage(named: "friImage")!,
        UIImage(named: "satImage")!,
        UIImage(named: "sunImage")!,
    ]
    
    let desc : [String] = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
    ]
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
        tableView.allowsSelection = true
        tableView.register(MyPlanTableViewCell.self, forCellReuseIdentifier: MyPlanTableViewCell.identifier)
        tableView.separatorColor = UIColor.gray
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        addComponents()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addComponents() {
        view.addSubview(coverImage)
        view.addSubview(scheduleLabel)
        view.addSubview(subScheduleLabel)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -550)
        ])
        
        NSLayoutConstraint.activate([
            scheduleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scheduleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scheduleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: -25),
            
            subScheduleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subScheduleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subScheduleLabel.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: subScheduleLabel.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPlanTableViewCell.identifier, for: indexPath) as? MyPlanTableViewCell else {
            fatalError("The tableView could not dequeue a MyPlanTableViewCell in MyPlanViewController")
        }
        let image = images[indexPath.row]
        let desc = desc[indexPath.row]
        
        
        cell.configure(with: image, and: desc)
        cell.contentView.backgroundColor = customBlueLight
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToNext()
    }
    
    @objc func goToNext() {
        let vc = SingleExerciseViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
