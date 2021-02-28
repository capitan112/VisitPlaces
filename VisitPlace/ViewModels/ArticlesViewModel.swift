//
//  ArticlesViewModel.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation

protocol ArticlesViewModelProtocol {
    func fetchArticles()
    var articles: Bindable<[Article]?> { get set }
}

class ArticlesViewModel: ArticlesViewModelProtocol {
    var articles: Bindable<[Article]?> = Bindable(nil)
    private let dataFetcher = NetworkDataFetcher()
    private var articlesURL = "https://cdn.theculturetrip.com/home-assignment/response.json"

    func fetchArticles() {
        dataFetcher.fetchArticles(by: articlesURL, completion: { response in
            guard let dict = try? response.get(), let articles = dict["data"] else {
                return
            }

            self.articles.value = articles
        })
    }
}
