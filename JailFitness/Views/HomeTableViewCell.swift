//
//  MyPlanTableViewCell.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-16.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .white
        return imageView
    }()
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.text = "Error"
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
    
    func configure(with image: UIImage, and label: String) {
        homeImageView.image = image
        homeLabel.text = label
    }
    
    func addComponents() {
        contentView.addSubview(homeImageView)
        contentView.addSubview(homeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            homeImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            homeImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            homeImageView.heightAnchor.constraint(equalToConstant: 120),
            homeImageView.widthAnchor.constraint(equalToConstant: 90),
            
            homeLabel.leadingAnchor.constraint(equalTo: homeImageView.trailingAnchor, constant: 20),
            homeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            homeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
