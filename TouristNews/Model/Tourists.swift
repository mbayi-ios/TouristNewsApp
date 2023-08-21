//
//  Tourists.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 21/08/2023.
//

import Foundation

struct TouristsArray: Decodable {
    let data: [Tourists]
}

struct Tourists: Decodable {
    let id: Int
    let touristName: String?
    let touristEmail: String?
    let touristLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case touristName = "tourist_name"
        case touristEmail = "tourist_email"
        case touristLocation = "tourist_location"
    }
}
