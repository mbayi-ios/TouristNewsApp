//
//  NewsViewModel.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import Foundation

class NewsViewModel {
    
    let news: News
    
    init(_ news: News) {
        self.news = news
    }
    
    var commentCount : String {
        return "Comment: \(self.news.commentCount)"
    }
}
