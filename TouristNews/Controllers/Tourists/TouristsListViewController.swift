//
//  TouristsListViewController.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 21/08/2023.
//

import UIKit

import UIKit

class TouristsListViewController: UIViewController {
    
    //private let news: [News] = News.getMockArray()
    private let viewModel: TouristsViewModel
    
    private let tableView: UITableView = {
     let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(TouristsCell.self, forCellReuseIdentifier: TouristsCell.identifier)
        
        return tableView
    }()
    
    init(_ viewModel: TouristsViewModel = TouristsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.viewModel.onNewsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    private func setupUI() {
        self.navigationItem.title = "Tourists"
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


extension TouristsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tourists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TouristsCell.identifier, for: indexPath) as? TouristsCell else {
            fatalError("unable to deques newscell in homecontroller")
        }
        
        let tourists = self.viewModel.tourists[indexPath.row]
        cell.configure(with: tourists)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let tourists = self.viewModel.tourists[indexPath.row]
        let viewModel = TouristDetailViewModel(tourists)
        
        let vc = TouristDetailViewController(viewModel)
        self.navigationController?.pushViewController(vc, animated: false)
    }
   
    
    
}
