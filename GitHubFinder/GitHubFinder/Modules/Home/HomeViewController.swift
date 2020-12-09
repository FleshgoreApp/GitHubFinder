//
//  HomeViewController.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlet's -
    @IBOutlet private weak var tableView: BaseTableView! {
        didSet {
            tableView.basicSettingsWith(self)
            tableView.register(UINib(nibName: GitTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: GitTableViewCell.cellID)
        }
    }
    
    private lazy var emptyStateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        tableView.tableHeaderView = label
        return label
    }()
    
    // MARK: - properties -
    private let searchController = BaseSearchController(searchResultsController: nil)
    
    var presenter: HomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupSearchController()
        setupNavigation()
    }
    
    // MARK: - Private -
    private func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Repository name ..."
        searchController.delegate = self
    }
    
    private func setupNavigation() {
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func showEmptyState() {
        let isEmpty = (presenter.repositories?.count ?? 0) > 0
        let frame = !isEmpty ? CGRect(x: 20, y: 15, width: view.frame.width-20, height: 40) : CGRect.zero
        emptyStateLabel.text = isEmpty ? "" : "No results"
        emptyStateLabel.frame = frame
    }
}

// MARK: - HomeViewInterface -

extension HomeViewController: HomeViewInterface {
    func updateView() {
        showEmptyState()
        tableView.reloadDataOnMainQueue()
    }
    
    func setViewTitle(_ title: String?) {
        self.title = title
    }
}

// MARK: - UITableViewDataSource -

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: GitTableViewCell.cellID, for: indexPath) as? GitTableViewCell {
            
            if let model = presenter.repositories?[indexPath.row] {
                cell.gonfigureBy(repo: model)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate -

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAtIndexPath(indexPath)
    }
}

//MARK: - UISearchBarDelegate -
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        presenter.searchBarSearchButtonClicked(searchText: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

//MARK: - UISearchControllerDelegate -

extension HomeViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        
    }
}
