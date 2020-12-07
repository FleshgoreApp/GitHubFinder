//
//  BaseNavigationController.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        self.view.backgroundColor = Constant.Color.navigationBarColor
    }
}
