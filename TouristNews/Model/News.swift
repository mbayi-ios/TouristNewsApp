//
//  News.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import Foundation

struct NewsArray: Decodable {
    let data: [News]
}

struct News: Decodable {
    let id: Int
    let title: String?
    let description: String?
    let location: String?
    let multimedia: [Multimedia]?
    let user : User?
    let commentCount: Int?
    
    
    struct Multimedia: Decodable {
        let id : Int?
        let title: String?
        let name: String?
        let description: String?
        let url: String?
    }
    
    struct User: Decodable {
        let userid: Int?
        let name: String?
        let profilePicture: String?
        
        enum CodingKeys: String, CodingKey {
            case userid
            case name
            case profilePicture = "profilepicture"
        }
    }
}

/*
extension News {
    public static func getMockArray() -> [News] {
        return [
            News(id: 4018, title: "LOVE SHIMLA", description: "shimla", location: "Shimla, Himachal Pradesh, India", multimedia: [Multimedia(id: 4787, title: "hello", name: "filename.jpg", description: "description", url: "https://www.adequatetravel.com/ATMultimedia/feedsmedia/7059/cf012b8a-723e-4e5e-b30e-b346b4b06541.jpg")], user: User(userid: 7059, name: "Happy Singh24", profilePicture: "https://www.adequatetravel.com/ATMultimedia/UserProfileCover/7059/2bc2d9ae-4bc0-445a-852f-e3b49d05c553.png"), commentCount: 2)
        ]
    }
}
*/
