//
//  GitTableViewCell.swift
//  GitHubFinder
//
//  Created by Saul Goodman on 07.12.2020.
//

import UIKit

protocol iGitTableViewCell {
    static var cellID: String { get }
    func gonfigureBy(repo: iRepoModel)
}

class GitTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
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
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.tintColor = .secondaryLabel
        separatorInset = .zero
    }
}

extension GitTableViewCell: iGitTableViewCell {
    func gonfigureBy(repo: iRepoModel) {
        self.titleLabel.text = repo.description
    }
}
