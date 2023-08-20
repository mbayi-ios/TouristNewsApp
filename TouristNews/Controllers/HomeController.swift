//
//  HomeController.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 20/08/2023.
//

import UIKit

class HomeController: UIViewController {
    
    private let news: [News] = News.getMockArray()
    
    private let tableView: UITableView = {
     let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    private func setupUI() {
        self.navigationItem.title = "Tour App"
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}


extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            fatalError("unable to deques newscell in homecontroller")
        }
        
        let news = self.news[indexPath.row]
        cell.configure(with: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let news = self.news[indexPath.row]
        let viewModel = NewsViewModel(news)
        
        let vc = ViewNewsController(viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    
    
}
