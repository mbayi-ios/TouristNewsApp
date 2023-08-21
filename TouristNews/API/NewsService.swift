//
//  NewsService.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import Foundation

enum NewsServiceError: Error {
    case unknown(String = "unknown error occured")
    case decodingError(String = "Error parsing server response")
}


class NewsService {
    
    static func fetchNews(with endpoint: Endpoint, completion: @escaping (Result<[News], NewsServiceError>) -> Void){
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, res, error in
//            if let error = error {
//                completion(.failure(.unknown(error)))
//                return
//            }
            
            if let res = res as? HTTPURLResponse, res.statusCode != 200 {
                do {
                   // let newsError = try JSONDecoder().decode(NewsServiceError.self, from: data ?? Data())
                   // completion(.failure(.decodingError()))
                    
                } catch let err {
                    completion(.failure(.unknown()))
                    print(err)
                }
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let newsData = try decoder.decode(NewsArray.self, from: data)
                    completion(.success(newsData.data))
                } catch let err {
                    completion(.failure(.decodingError()))
                    print(err)
                }
                
            } else {
                completion(.failure(.unknown()))
            }
        }.resume()
    }
}
