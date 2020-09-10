//
//  NewsFeedModel.swift
//  NewsApp -> MVC
//
//  Created by a on 03.09.2020.
//  Copyright © 2020 a. All rights reserved.
//


import Foundation

struct NewsFeed: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]?
}

struct Article: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?

}
