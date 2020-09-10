//
//  ViewController.swift
//  NewsApp -> MVC
//
//  Created by a on 03.09.2020.
//  Copyright © 2020 a. All rights reserved.
//

import UIKit


let cellId = "cellId"

class MainViewController: UITableViewController  {
    
    var info: NewsFeed?
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        downloadJson()
        tableView.alwaysBounceVertical = true
        tableView.backgroundColor = UIColor(named: "backGroundColor")
        navigationItem.title = "News 2020"
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
    }
    

  func downloadJson() {
     guard let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-08-10&sortBy=publishedAt&apiKey=2e1be8393db748878a1683f2cb9db620") else { return }

       let request = NSMutableURLRequest(url: url)
       request.httpMethod = "GET"
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")

       let task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in

           do {
            guard let data = data else { print("data is nil!"); return }
               let moovieData = try JSONDecoder().decode(NewsFeed.self, from: data)
               self?.info = moovieData

               DispatchQueue.main.async {
                   self?.tableView.reloadData()
               }
           }

           catch let jsonError {
               print(jsonError)
           }
       }

       task.resume()

   }

}



extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = info?.articles?.count else { return 0 }
        return count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell
        
        if let data = info {
        
            cell.titleLabel.text = data.articles?[indexPath.item].title
            
            cell.descriptionLabel.text = data.articles?[indexPath.item].description


            if let imageInfo = data.articles?[indexPath.item].urlToImage {
                if let unwrappedUrl = URL(string: imageInfo) {
                    cell.newsImage.downloaded(from: unwrappedUrl)
                }
            }

        }

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()

        if let data = info {
            detailVC.author = data.articles?[indexPath.row].author
            detailVC.titleName = data.articles?[indexPath.row].title
            detailVC.title = data.articles?[indexPath.row].title
            detailVC.descriptionDetail = data.articles?[indexPath.row].description

            guard let imageInfo = data.articles?[indexPath.row].urlToImage else { return }

            guard let unwrappedUrl = URL(string: imageInfo) else { return }
            detailVC.imageURL = unwrappedUrl

        }

        self.navigationController?.pushViewController(detailVC, animated: true )
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
}


