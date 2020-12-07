//
//  NavigationThemeInitializer.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

struct NavigationThemeInitializer: Initializable {
    private let titlesColor = UIColor.label
    private let barTintColor = Constant.Color.navigationBarColor
    
    func performInitialization() {
        let navigationApperance = UINavigationBar.appearance(whenContainedInInstancesOf: [BaseNavigationController.self])
        
        navigationApperance.prefersLargeTitles = true
        navigationApperance.isTranslucent = false
        navigationApperance.tintColor = .red
        navigationApperance.barTintColor = barTintColor
        navigationApperance.titleTextAttributes = [.foregroundColor: titlesColor]
        navigationApperance.largeTitleTextAttributes = [.foregroundColor: titlesColor]
        navigationApperance.backgroundColor = barTintColor
    }
}
