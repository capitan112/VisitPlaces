//
//  ArticlesViewModelSpec.swift
//  VisitPlaceTests
//
//  Created by Oleksiy Chebotarov on 27/02/2021.
//

import Foundation
import Nimble
import Quick
@testable import VisitPlace

class ArticlesViewModelSpec: QuickSpec {
    override func spec() {
        var subject: MockArticlesViewModel!

        describe("The ArticlesViewModel") {
            context("Can fetch data") {
                beforeEach {
                    subject = MockArticlesViewModel()
                }

                afterEach {
                    subject = nil
                }

                it("when it not fetched it should be false") {
                    expect(subject.isFetchArticleCalled).to(beFalse())
                }

                it("when it fetched it should be true") {
                    subject.fetchArticles()
                    expect(subject.isFetchArticleCalled).to(beTrue())
                }
            }
        }
    }
}
