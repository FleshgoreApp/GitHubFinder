//
//  BaseViewController.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        setup()
    }
    
    func setup() {
        self.view.backgroundColor = Constant.Color.navigationBarColor
    }
}
