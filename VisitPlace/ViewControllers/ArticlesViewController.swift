//
//  ArticlesViewController.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation
import UIKit

class ArticlesViewController: UITableViewController, Storyboarded {
    var viewModel: ArticlesViewModelProtocol? {
        didSet {
            setupBindings()
        }
    }

    var coordinator: ArticleFlow?
    private var articles: [Article]?

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func setupBindings() {
        viewModel?.articles.bind { articles in
            if let articles = articles {
                self.articles = articles
                self.reloadTableView()
            }
        }
    }

    private func reloadTableView() {
        performUIUpdatesOnMain { [unowned self] in
            self.tableView.reloadData()
        }
    }

    private func configTableView() {
        let className = String(describing: ArticleTableViewCell.self)
        tableView.register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.reuseIdentifier)
        tableView.rowHeight = 100.0
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return articles?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = ArticleTableViewCell.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArticleTableViewCell
        if let articles = articles {
            let articleViewModelCell = ArticleViewModelCell(article: articles[indexPath.row])
            cell.viewModel = articleViewModelCell
        }

        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {}
}
