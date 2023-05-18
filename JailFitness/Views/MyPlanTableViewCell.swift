//
//  MyPlanTableViewCell.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-05-16.
//

import UIKit

class MyPlanTableViewCell: UITableViewCell {

    static let identifier = "MyPlanTableViewCell"
    
    let myPlanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .white
        return imageView
    }()
    
    let myPlanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Poppins-Regular", size: 18)
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
        myPlanImageView.image = image
        myPlanLabel.text = label
    }
    
    func addComponents() {
        contentView.addSubview(myPlanImageView)
        contentView.addSubview(myPlanLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            myPlanImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            myPlanImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            myPlanImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            myPlanImageView.heightAnchor.constraint(equalToConstant: 120),
            myPlanImageView.widthAnchor.constraint(equalToConstant: 90),
            
            myPlanLabel.leadingAnchor.constraint(equalTo: myPlanImageView.trailingAnchor, constant: 10),
            myPlanLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            myPlanLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            myPlanLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
