//
//  ScheduleTableViewCell.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-20.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    static let identifier = "ScheduleTableViewCell"
    
    let scheduleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .white
        return imageView
    }()
    
    let scheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "Error"
        return label
    }()
    
    let scheduleDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.text = "Error"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        label.sizeToFit()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage, label: String, labelDesc: String) {
        scheduleImageView.image = image
        scheduleLabel.text = label
        scheduleDescLabel.text = labelDesc
    }
    
    func addComponents() {
        contentView.addSubview(scheduleImageView)
        contentView.addSubview(scheduleLabel)
        contentView.addSubview(scheduleDescLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scheduleImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            scheduleImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            scheduleImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            scheduleImageView.heightAnchor.constraint(equalToConstant: 120),
            scheduleImageView.widthAnchor.constraint(equalToConstant: 90),
            
            scheduleLabel.leadingAnchor.constraint(equalTo: scheduleImageView.trailingAnchor, constant: 20),
            scheduleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            scheduleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -50),
            scheduleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            scheduleDescLabel.leadingAnchor.constraint(equalTo: scheduleImageView.trailingAnchor, constant: 20),
            scheduleDescLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            scheduleDescLabel.centerXAnchor.constraint(equalTo: scheduleLabel.centerXAnchor),
            scheduleDescLabel.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: -80),
            
        ])
    }

}
