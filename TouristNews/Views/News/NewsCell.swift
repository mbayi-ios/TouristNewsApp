//
//  NewsCell.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {
    static let identifier = "NewsCell"
    
    private(set) var news: News!
    
    private let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "photo.on.rectangle.angled")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.textAlignment = .left
        title.font = .systemFont(ofSize: 22, weight: .semibold)
        title.text = "Error"
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with news: News) {
        self.news = news
        
        self.title.text = news.title ?? "no name"
        self.newsImage.sd_setImage(with: URL(string: news.user?.profilePicture ?? ""), placeholderImage: UIImage(systemName: "photo.on.rectangle.angled"))
    }
    
    private func setupUI() {
        self.addSubview(newsImage)
        self.addSubview(title)
        
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newsImage.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            newsImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            newsImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            title.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 16),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
