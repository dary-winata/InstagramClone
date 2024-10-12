//
//  HomeTabBarViewController.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 12/10/24.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    
    let viewModel: HomeTabBarViewModelProtocol
    
    init(viewModel: HomeTabBarViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
}

extension HomeTabBarViewController: HomeTabBarViewModelDelegate {
    func setupView() {
        // home
        let homeTabbarItem: UITabBarItem = UITabBarItem(title: " ",
                                                        image: UIImage(named: "home_icon")?.resizeImage(width: 24),
                                                        tag: 0)
        homeTabbarItem.selectedImage = UIImage(named: "home_icon_fill")?.resizeImage(width: 24)
        let vc1 = HomeTabBarItemTempViewController(bgColor: .blue)
        vc1.tabBarItem = homeTabbarItem
        
        // search
        let searchTabbarItem: UITabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        searchTabbarItem.selectedImage = UIImage(systemName: "magnifyingglass",
                                                 withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 18, weight: .bold)))
        let vc2 = HomeTabBarItemTempViewController(bgColor: .red)
        vc2.tabBarItem = searchTabbarItem
        
        // post
        let postTabbarItem: UITabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus.app"), tag: 2)
        postTabbarItem.selectedImage = UIImage(systemName: "plus.app.fill")
        let vc3 = HomeTabBarItemTempViewController(bgColor: .green)
        vc3.tabBarItem = postTabbarItem
        
        // notification
        let notificationTabbarItem: UITabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 3)
        notificationTabbarItem.selectedImage = UIImage(systemName: "heart.fill")
        let vc4 = HomeTabBarItemTempViewController(bgColor: .brown)
        vc4.tabBarItem = notificationTabbarItem
        
        // profile
        let profileTabbarItem: UITabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), tag: 4)
        profileTabbarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        let vc5 = HomeTabBarItemTempViewController(bgColor: .cyan)
        vc5.tabBarItem = profileTabbarItem
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5]
        delegate = self
    }
}

extension HomeTabBarViewController: UITabBarControllerDelegate {
    
}

