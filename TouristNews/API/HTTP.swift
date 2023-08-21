//
//  HTTP.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import Foundation

enum HTTP {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        enum Key: String {
            case contentType = "Content-Type"
            case apiKey = "API_KEY"
        }
        
        enum Value: String {
            case applicationJson = "application/json"
        }
    }
}
