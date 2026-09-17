//
//  News.swift
//  NewsApp
//
//  Created by Mouli Agastya on 9/14/26.
//

import UIKit

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
    let urlToImage: String?
    let publishedAt: String
    
    var formattedDate: String {
        publishedAt.formatDate()
    }
}

