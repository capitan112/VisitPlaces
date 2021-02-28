//
//  ArticleCellViewTest.swift
//  VisitPlaceTests
//
//  Created by Oleksiy Chebotarov on 27/02/2021.
//

import SnapshotTesting
import XCTest
@testable import VisitPlace

class ArticleCellViewRenderingTest: XCTestCase {
    
    func testArticleCellViewRenderingTest() {
        let articleCellView: ArticleTableViewCell = ArticleTableViewCell.fromNib()

        let jsonData = json.data(using: .utf8)!
        let article: Article = try! JSONDecoder().decode(Article.self, from: jsonData)
        let viewModel = ArticleViewModelCell(article: article)

        articleCellView.viewModel = viewModel
        assertSnapshot(matching: articleCellView, as: .image)
    }
}

let json = """
{
        "metaData": {
            "creationTime": "2017-04-26T12:02:58.000Z",
            "updateTime": "2017-06-19T14:27:08.000Z"
        },
        "id": "16911920427781819001",
        "title": "10 Reasons Why You Should Visit Tel Aviv",
        "imageUrl": "https://cdn.theculturetrip.com/wp-content/uploads/2017/03/jaffa-old-city-door.jpg",
        "isSaved": false,
        "isLiked": false,
        "likesCount": 12,
        "category": "Art",
        "author": {
            "id": "3571",
            "authorName": "Ben Jakob",
            "authorAvatar": {
                "imageUrl": "https://0.gravatar.com/avatar/430b63571071ec81d57f3605b59a2508?s=50&d=https://cdn.theculturetrip.com/logo/logo50.png&r=g"
            }
        }
    }
"""
