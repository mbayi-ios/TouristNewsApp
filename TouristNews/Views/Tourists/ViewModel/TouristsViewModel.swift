//
//  TouristsViewModel.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 21/08/2023.
//

import Foundation


import Foundation


class TouristsViewModel {
    var onNewsUpdated: (() -> Void)?
   // var onErrorMessage: (()
    
    private(set) var tourists: [Tourists] = [] {
        didSet {
            self.onNewsUpdated?()
        }
    }
    
    init() {
        self.fetchTourists()
    }
    
    public func fetchTourists() {
        let endpoint = Endpoint.fetchTourists()
        
        TouristService.fetchTourists(with: endpoint) { [weak self] result in
            switch result {
            case .success(let tourists):
                self?.tourists = tourists
                print("DEBBUG PRINT: ", "\(tourists.count) news fetch")
                
            case .failure(let error):
               print(error)
            }
        }
    }
}
