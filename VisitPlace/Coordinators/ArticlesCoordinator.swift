//
//  ArticlesCoordinator.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation
import UIKit

protocol ArticleFlow: class {
    func coordinateToArticle()
}

class ArticlesCoordinator: Coordinator, ArticleFlow {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let articlesViewController = ArticlesViewController.instantiate(storyboardName: "Main")
        let articlesViewModel = ArticlesViewModel()
        articlesViewController.coordinator = self
        articlesViewController.viewModel = articlesViewModel
        articlesViewModel.fetchArticles()
        navigationController.pushViewController(articlesViewController, animated: true)
    }

    func coordinateToArticle() {}
}
