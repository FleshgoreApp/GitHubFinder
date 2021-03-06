//
//  HomePresenter.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class HomePresenter {
    
    // MARK: - Private properties -
    
    private unowned let view: HomeViewInterface
    private let interactor: HomeInteractorInterface
    private let wireframe: HomeWireframeInterface
    fileprivate var currentPage: Int = 1
    
    // MARK: - Open properties -
    
    var repositories: [RepoModel]? {
        didSet {
            repositories?.sort(by: >)
            DispatchQueue.main.async { [weak self] in
                self?.view.updateView()
            }
        }
    }
    
    // MARK: - Lifecycle -
    
    init(view: HomeViewInterface, interactor: HomeInteractorInterface, wireframe: HomeWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {
    func viewDidLoad() {
        view.setViewTitle("GitHubFinder")
    }
    
    func searchBarSearchButtonClicked(searchText: String?) {
        guard let text = searchText else { return }
        
        let searchGroup = DispatchGroup()
        let userQueue = DispatchQueue.global(qos: .userInteractive)
        var temp = [RepoModel]()
        
        var counter = 0 {
            didSet {
                if counter == 2 { //Hard-code
                    searchGroup.leave()
                }
            }
        }
        
        searchGroup.enter()
        
        userQueue.async { [weak self] in
            self?.interactor.searchRepositoriesWith(text: text, page: self?.currentPage ?? 0, completion: { repositories, error in

                if let items = repositories?.items, error == nil {
                    userQueue.sync(flags: .barrier) {
                        temp.append(contentsOf: items)
                        counter += 1
                    }
                }
                else {
                    userQueue.sync(flags: .barrier) {
                        counter += 1
                    }
                }
            })
       
            self?.interactor.searchRepositoriesWith(text: text, page: (self?.currentPage ?? 0)+1, completion: { repositories, error in
                
                if let items = repositories?.items, error == nil {
                    userQueue.sync(flags: .barrier) {
                        temp.append(contentsOf: items)
                        counter += 1
                    }
                }
                else {
                    userQueue.sync(flags: .barrier) {
                        counter += 1
                    }
                }
            })
        }
        
        searchGroup.notify(queue: DispatchQueue.global()) { [weak self] in
            self?.repositories = temp
        }
    }
    
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        wireframe.navigate(to: .details(repositories?[indexPath.row]))
    }
}
