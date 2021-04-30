//
//  NewsListViewModel.swift
//  MyNews
//
//  Created by Иван Рыбин on 21.04.2021.
//

import Foundation

class NewsListViewModel {
    
    var newsVM = [NewsViewModel] ()
    
    let reuseID = "News"
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        
        NetworkManager.shared.getNews { (News) in
            guard let News = News else {return}
            let newsVM = News.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
            
        }
        
    }
    
}
