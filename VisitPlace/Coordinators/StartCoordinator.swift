//
//  StartCoordinator.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation
import UIKit

protocol StartFlow: class {
    func coordinateToArticles()
}

class StartCoordinator: Coordinator, StartFlow {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let startViewController = StartViewController.instantiate(storyboardName: "Main")
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: true)
    }

    func coordinateToArticles() {
        let articlesCoordinator = ArticlesCoordinator(navigationController: navigationController)
        coordinate(to: articlesCoordinator)
    }
}
