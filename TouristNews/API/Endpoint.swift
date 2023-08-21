//
//  Endpoint.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import Foundation


enum Endpoint {
    case fetchNews(url: String = "/api/Feed/GetNewsFeed")
    
    case fetchTourists(url: String = "/api/Tourist")
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.addValues(for: self)
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme 
        components.host = Constants.baseURL
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }
    
    private var path: String {
        switch self {
        case .fetchNews(let url):
            return url
        case .fetchTourists(let url):
            return url
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .fetchNews:
            return [
                URLQueryItem(name: "page", value: "1"),
            ]
            
        case .fetchTourists:
            return [
                URLQueryItem(name: "page", value: "2")
            ]
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .fetchNews:
            return HTTP.Method.get.rawValue
            
        case .fetchTourists:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .fetchNews:
            return nil
        case .fetchTourists:
            return nil
        }
    }

}

extension URLRequest {
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
        case .fetchNews, .fetchTourists:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
            self.setValue(Constants.API_KEY, forHTTPHeaderField: HTTP.Headers.Key.apiKey.rawValue)
        }
    }
}
