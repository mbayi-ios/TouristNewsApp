//
//  HomeViewModel.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import Foundation


class HomeViewModel {
    var onNewsUpdated: (() -> Void)?
   // var onErrorMessage: (()
    
    private(set) var news: [News] = [] {
        didSet {
            self.onNewsUpdated?()
        }
    }
    
    init() {
        self.fetchNews()
    }
    
    public func fetchNews() {
        let endpoint = Endpoint.fetchNews()
        
        NewsService.fetchNews(with: endpoint) { [weak self] result in
            switch result {
            case .success(let news):
                self?.news = news
                print("DEBBUG PRINT: ", "\(news.count) news fetch")
                
            case .failure(let error):
               print(error)
            }
        }
    }
}
