//
//  ArticleViewModelCell.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation

class ArticleViewModelCell: ArticleViewModelCellType {
    var article: Article
    init(article: Article) {
        self.article = article
    }
}
