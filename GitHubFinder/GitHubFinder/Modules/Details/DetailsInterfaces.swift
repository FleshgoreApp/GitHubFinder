//
//  DetailsInterfaces.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol DetailsWireframeInterface: WireframeInterface {
}

protocol DetailsViewInterface: ViewInterface {
    func updateView(text: String?)
}

protocol DetailsPresenterInterface: PresenterInterface {
    var repo: RepoModel? { get }
}

protocol DetailsInteractorInterface: InteractorInterface {
}
