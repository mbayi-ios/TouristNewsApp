//
//  TabBar.swift
//  TouristNews
//
//  Created by Ambrose Mbayi on 21/08/2023.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        setup()
    }
    
    func setup() {
        viewControllers = [
            createNavController(for: NewsFeedViewController(), title: NSLocalizedString("News", comment: ""), image: UIImage(systemName: "newspaper.fill")!),
            createNavController(for: TouristsListViewController(), title: NSLocalizedString("Tourists", comment: ""), image: UIImage(systemName: "person.2.circle.fill")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
