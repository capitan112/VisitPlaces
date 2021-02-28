//
//  Articles.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation
import UIKit

struct Article: Decodable {
    let metaData: MetaData
    let id: String
    let title: String
    let imageUrl: String
    let isSaved: Bool
    let isLiked: Bool
    let likesCount: Int
    let category: String
    let author: Author
    var articleImageUrl: URL? {
        return URL(string: imageUrl)
    }
}

struct MetaData: Decodable {
    let creationTime: String
    let updateTime: String
}

struct Author: Decodable {
    let id: String
    let authorName: String
    let imageUrl: String
    var avatarURL: URL? {
        return URL(string: imageUrl)
    }

    enum CodingKeys: String, CodingKey {
        case id, authorName
        case imageUrl
        case authorAvatar
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        authorName = try container.decode(String.self, forKey: .authorName)
        let dict = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .authorAvatar)
        imageUrl = try dict.decode(String.self, forKey: .imageUrl)
    }
}

extension Article: Hashable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.imageUrl == rhs.imageUrl
            && lhs.category == rhs.category
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(imageUrl)
        hasher.combine(category)
    }
}
