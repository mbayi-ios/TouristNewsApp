//
//  TouristService.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 21/08/2023.
//

import Foundation

enum TouristServiceError: Error {
    case unknown(String = "unknown error occured")
    case decodingError(String = "Error parsing server response")
}

class TouristService {
    static func fetchTourists(with endpoint: Endpoint, completion: @escaping (Result<[Tourists], TouristServiceError>) -> Void){
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, res, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let touristData = try decoder.decode(TouristsArray.self, from: data)
                    completion(.success(touristData.data))
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
