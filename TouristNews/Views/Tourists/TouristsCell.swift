//
//  TouristCell.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 21/08/2023.
//

import Foundation


import UIKit

class TouristsCell: UITableViewCell {
    static let identifier = "TouristsCell"
    
    private(set) var tourists: Tourists!
    
    
    private let touristName: UILabel = {
        let touristName = UILabel()
        touristName.textColor = .label
        touristName.textAlignment = .left
        touristName.font = .systemFont(ofSize: 18, weight: .medium)
        touristName.text = "no name"
        return touristName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with tourists: Tourists) {
        self.tourists = tourists
        
        self.touristName.text = tourists.touristName
    }
    
    private func setupUI() {
        self.addSubview(touristName)
        
        touristName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            touristName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            touristName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
            
        ])
    }
}
