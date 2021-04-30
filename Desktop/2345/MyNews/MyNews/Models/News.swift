//
//  News.swift
//  MyNews
//
//  Created by Иван Рыбин on 20.04.2021.
//

import Foundation

struct News: Decodable {
    
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
    
}

struct NewsEnvelope: Decodable {
    
    let status: String?
    let totalResults: Int
    let articles: [News]
    
}
