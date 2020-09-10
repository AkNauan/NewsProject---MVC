//
//  NewsCell.swift
//  NewsApp -> MVC
//
//  Created by a on 10.09.2020.
//  Copyright © 2020 a. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(named: "backGroundColor")

        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.layer.masksToBounds = true
        return label
    }()
    

    var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
     private func setConstraints() {
          contentView.addSubview(titleLabel)
          contentView.addSubview(descriptionLabel)
          contentView.addSubview(newsImage)
          
          NSLayoutConstraint.activate([
              titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: +5),
              titleLabel.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: +10),
              titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
          ])
          
          NSLayoutConstraint.activate([
              descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: +10),
              descriptionLabel.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: +10),
              descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
          ])
          
          let size = contentView.width/3
          NSLayoutConstraint.activate([
              newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: +10),
             newsImage.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
              newsImage.heightAnchor.constraint(equalToConstant: size),
              newsImage.widthAnchor.constraint(equalToConstant: size)
            
          ])
        
          
      }
    
    
 
    
}

