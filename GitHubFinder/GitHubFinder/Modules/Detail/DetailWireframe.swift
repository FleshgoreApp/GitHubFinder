//
//  DetailWireframe.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailWireframe: BaseWireframe {

    // MARK: - Module setup -

    init() {
        let moduleViewController = DetailViewController()
        super.init(viewController: moduleViewController)

        let interactor = DetailInteractor()
        let presenter = DetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension DetailWireframe: DetailWireframeInterface {
}
