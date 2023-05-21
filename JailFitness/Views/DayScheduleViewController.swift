//
//  DayScheduleViewController.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-20.
//

import UIKit
import Firebase
import FirebaseFirestore

class DayScheduleViewController: UIViewController {
    
    let db = Firestore.firestore()

    let customBlue = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
    let customBlueLight = UIColor(red: 42.0/255.0, green: 47.0/255.0, blue: 55.0/255.0, alpha: 1)
    let customYellow = UIColor(red: 225.0/255.0, green: 254.0/255.0, blue: 17.0/255.0, alpha: 1)
    
    let coverImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dayScheduleImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let scheduleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.textColor = .white
        label.text = "Day Schedule"
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
        label.text = "Success usually comes to those who are too busy to be looking for it."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 39.0/255.0, alpha: 1)
        tableView.allowsSelection = true
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        tableView.separatorColor = UIColor.gray
        return tableView
    }()
    
    var dataArray: [[String: Any]] = []
    var nameDA: [String] = []
    var descriptionDA: [String] = []
    var imageDA: [String] = []
    var path: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customBlue
        
        addComponents()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        dataArray = []
        nameDA = []
        descriptionDA = []
                
        readDocument(pathStr: path)
    }
    
    func readDocument(pathStr: String){
            
            db.collection(pathStr).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.dataArray.append(data)
                    }
                    
                    self.saveNameArray()
                    self.saveDescriptionArray()
                    self.saveImage()
                    self.tableView.reloadData()
                }
            }
        }
        
        func saveNameArray() {
            for data in dataArray {
                self.nameDA.append(data["name"] as! String)
            }
        }
        
        func saveDescriptionArray() {
            for data in dataArray {
                self.descriptionDA.append(data["description"] as! String)
            }
        }
    
        func saveImage() {
            for data in dataArray {
                self.imageDA.append(data["image"] as! String)
            }
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
            coverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500)
        ])
        
        NSLayoutConstraint.activate([
            scheduleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scheduleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scheduleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: -80),
            
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

extension DayScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else {
            fatalError("The tableView could not dequeue a MyPlanTableViewCell in MyPlanViewController")
        }
        
        let imageGet = UIImage(named: imageDA[indexPath.row])
        let image = imageGet
        
        let label = nameDA[indexPath.row]
        let labelMini = descriptionDA[indexPath.row]
        
        cell.configure(with: image!, label: label, labelDesc: labelMini)
        
        cell.contentView.backgroundColor = customBlueLight
        return cell
    }
}
