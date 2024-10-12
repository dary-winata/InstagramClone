//
//  HomeTabBarItemTempViewController.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 12/10/24.
//

import UIKit

class HomeTabBarItemTempViewController: UIViewController {
    
    let bgColor: UIColor
    
    init(bgColor: UIColor) {
        self.bgColor = bgColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
    }
}
