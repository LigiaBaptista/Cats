//
//  TabBarViewController.swift
//  Cats
//
//  Created by Lígia Maria on 08/09/22.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    init() {
        let listController: CatsListViewController = .init()
        let listTabItem: UITabBarItem = .init(title: "Lista", image: UIImage(named: "list"), tag: 0)
        listController.tabBarItem = listTabItem
        
        let controller: FavoritesViewController = .init()
        let controllerTabItem: UITabBarItem = .init(title: "Favorites", image: UIImage(named: "favorites"), tag: 1)
        controller.tabBarItem = controllerTabItem
        
        super.init(nibName: nil, bundle: nil)
        viewControllers = [listController, controller]
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTabBar() {
        view.backgroundColor = .systemMint
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemMint
        tabBar.tintColor = .black
    }
}
