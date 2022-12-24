//
//  HomeUITabBarController.swift
//  firstProject
//
//  Created by Saleh Naser on 17/12/2022.
//

import UIKit

class HomeUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 2
        self.navigationItem.setHidesBackButton(true, animated: true)
       
    }
}
    
