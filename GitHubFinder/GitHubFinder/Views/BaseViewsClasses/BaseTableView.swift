//
//  BaseTableView.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

protocol iBaseTableView {
    func basicSettingsWith(_ view: UIViewController)
}

final class BaseTableView: UITableView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .clear
        self.tableFooterView = UIView()
        self.keyboardDismissMode = .onDrag
    }
}

extension BaseTableView: iBaseTableView {
    func basicSettingsWith(_ view: UIViewController) {
        self.delegate = view as? UITableViewDelegate
        self.dataSource = view as? UITableViewDataSource
    }
}
