//
//  DetailViewController.swift
//  NewsApp -> MVC
//
//  Created by a on 03.09.2020.
//  Copyright © 2020 a. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var author: String?
    var titleName: String?
    var descriptionDetail: String?
    var publishedTime: String?
    var imageURL : URL?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .right
        return label
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        
        return label
    }()
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
       
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "backGroundColor")
        self.newsImage.downloaded(from: imageURL!)
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        descriptionLabel.text = descriptionDetail
        titleLabel.text = titleName
        if let avtor = author {
            authorLabel.text = avtor + " 2020"
        }
    }

    
    
    private func setConstraints() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(newsImage)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(authorLabel)
       
            
        let size = self.view.height/2
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: +10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: +10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
    
            
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: +10),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +10),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            authorLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
            
        ])
        
        NSLayoutConstraint.activate([
            newsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: +10),
            newsImage.heightAnchor.constraint(equalToConstant: size),
            newsImage.widthAnchor.constraint(equalToConstant: size),
            
        ])
        
        
    }
    
}



