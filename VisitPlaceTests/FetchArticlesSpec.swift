//
//  FetchArticlesSpec.swift
//  VisitPlaceTests
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//
import Foundation
import Nimble
import Quick
@testable import VisitPlace

class FetchArticlesSpec: QuickSpec {
    override func spec() {
        var subject: ArticlesViewModelProtocol!
        describe("fetch article in ViewModel") {
            context("should get real data of article") {
                beforeEach {
                    subject = ArticlesViewModel()
                }

                afterEach {
                    subject = nil
                }

                it("first article properties should be equal") {
                    subject.fetchArticles()
                    expect(subject.articles.value?.first?.id).toEventually(equal("16911920427781819001"))
                    expect(subject.articles.value?.first?.title).toEventually(equal("10 Reasons Why You Should Visit Tel Aviv"))
                    expect(subject.articles.value?.first?.imageUrl).toEventually(equal("https://cdn.theculturetrip.com/wp-content/uploads/2017/03/jaffa-old-city-door.jpg"))
                    expect(subject.articles.value?.first?.likesCount).toEventually(equal(12))
                    expect(subject.articles.value?.first?.category).toEventually(equal("Art"))
                }
            }
        }
    }
}
