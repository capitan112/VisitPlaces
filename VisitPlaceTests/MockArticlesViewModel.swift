//
//  MockArticleViewModelCell.swift
//  VisitPlaceTests
//
//  Created by Oleksiy Chebotarov on 27/02/2021.
//

import Foundation
@testable import VisitPlace

class MockArticlesViewModel: ArticlesViewModelProtocol {
    var articles: Bindable<[Article]?> = Bindable(nil)
    var isFetchArticleCalled = false

    func fetchArticles() {
        isFetchArticleCalled = true
    }
}
