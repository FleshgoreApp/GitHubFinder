//
//  GitTableViewCell.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

protocol iGitTableViewCell {
    static var cellID: String { get }
}

class GitTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    static var cellID: String = "GitTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupViews() {
        titleLabel.text = "Some text"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.tintColor = .secondaryLabel
    }
}

extension GitTableViewCell: iGitTableViewCell {
    
}
